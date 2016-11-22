class ChargesController < ApplicationController
  before_action :setup_stripe_service, only: :create
  before_action :setup_mcapi, only: :subscribe

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
      @file_name = params[:file_name]
      subscribe_to_list(MAILCHIMP_LIST_ID, params[:email], params[:name])
      render :preview
    else
      redirect_to root_path
    end
  end

  # Download file
  def download
    if params[:file_name].present?
      file_name = params[:file_name]
      if File.exist? "#{Rails.root}/public/content/#{file_name}"
        send_file "#{Rails.root}/public/content/#{file_name}"
      else
        flash[:error] = "File not found."
        redirect_to downloable_path
      end
    else
      flash[:error] = "Invalid request."
      redirect_to downloable_path
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
      @mc = Mailchimp::API.new(MAILCHIMP_API_KEY)
    end

    # subscribe to mailchimp list
    def subscribe_to_list(list_id, email, name)
      begin
        @mc.lists.subscribe(list_id, { email: email}, merge_vars: { FIRSTNAME: name, STATUS: 'Subscribed' })
        flash[:success] = 'To complete the subscription process, please click the link in the email we just sent you.'
      rescue Mailchimp::ListAlreadySubscribedError
        flash[:warning] = "#{email} is already subscribed to the list"
      rescue Mailchimp::ListDoesNotExistError
        flash[:error] = "The list could not be found"
      rescue Mailchimp::Error => ex
        if ex.message
          flash[:warning] = ex.message
        else
          flash[:warning] = "An unknown error occurred"
        end
      end
    end
end
