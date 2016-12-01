class ChargesController < ApplicationController
  before_action :setup_stripe_service, only: :create
  before_action :setup_mcapi, only: :subscribe
  layout "layout_simple", only: [:promotion01]

  def promotion01
    render :subscribers_to_customers
  end

  def create
    widget = find_widget(params[:widget])
    token = params[:stripeToken]
    email = params[:stripeEmail]
    description = params[:stripeDescription]

    if widget
      amount = widget[:amount]
      description = widget[:description]
      begin
       customer = @stripe_service.create_customer(email, token, description)
       charge = @stripe_service.charge_customer(customer.id, widget[:stripe_id])
       # redirect_to {path you want to send the user to if payment was successful} if charge.paid
      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to root_path
      end
    else

    end
  end

  # check if cookie exists
  def get_cookies
    if cookies.signed[:name].present? && cookies.signed[:email].present?
      render json: { allow: true, name: cookies.signed[:name], email: cookies.signed[:email] }
    else
      render json: { allow: false }
    end
  end

  # Set cookies and subscribe to mailchimp list
  def subscribe
    if params[:name].present? && params[:email].present? && params[:file_name].present?
      cookies.signed[:name] = params[:name]
      cookies.signed[:email] = params[:email]
      subscribe_to_list(MAILCHIMP_LIST_ID, params[:email], params[:name])
      download_lnk = HTTParty.get("https://cloud-api.yandex.net/v1/disk/resources/download?path=#{params[:file_name]}",
                                  headers: {"Authorization" => YANDEX_DISK_ACCESS_TOKEN})

      session["need_download?"] = CGI.escape(download_lnk.parsed_response["href"])
      render :preview
    else
      redirect_to root_path
    end
  end

  def download?
    file_name = session["need_download?"]
    session["need_download?"] = nil
    render json: {file_url: file_name}
  end


  # Download file
  def download
    if params[:file_name].present?
      if File.exist? "#{Rails.root}/public/content/#{params[:file_name]}"
        send_file params[:file_name]
      else
        flash[:error] = "File not found."
        redirect_to root_path
      end
    else
      flash[:error] = "Invalid request."
      redirect_to root_path
    end
  end

  def popup
    render "popup"
  end

  #def new and other actions

  private
    def setup_stripe_service
      @stripe_service = StripeService.new
    end

    def find_widget(widget_id)
      # widget_id = params[:widget]
      widget = widgets[widget_id.to_sym]
    end

    def setup_mcapi
      @mc = Gibbon::Request.new(api_key: MAILCHIMP_API_KEY)
    end

    # subscribe to mailchimp list
    def subscribe_to_list(list_id, email, name)
      begin
        @mc.lists(list_id).members.
          create(body: {email_address: email, status: "subscribed", merge_fields: {FNAME: name}})
        flash[:success] = 'You\'re all set! Enjoy your mix!'
      rescue Gibbon::MailChimpError => e
        flash[:warning] = e.message
      end
    end
end
