class ChargesController < ApplicationController
  before_action :setup_stripe_service, only: :create
  
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
  
  #def new and other actions
  
  private
    def setup_stripe_service
      @stripe_service = StripeService.new
    end
    
    def find_widget(widget_id)
      # widget_id = params[:widget]
      widget = widgets[widget_id.to_sym]
    end
end