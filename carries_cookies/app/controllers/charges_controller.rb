class ChargesController < ApplicationController


	def new
	end

	def create


	  # Amount in cents
	  widget_id = params[:widget] #w1, w2, w3
	  widget = widgets[widget_id.to_sym]
	  amount = widget[:amount]
	  token = params[:stripeToken]
	  email = params[:stripeEmail]
	  description = widget[:description]
	  # @amount = 100

	  customer = Stripe::Customer.create(
	    :email => email,
	    :card  => token
	  )

	  # binding.pry
	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => amount,
	    :description => description,
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
# end
end
