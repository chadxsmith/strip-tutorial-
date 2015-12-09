class ChargesController < ApplicationController


	def new
	end

	def create
	  # Amount in cents
	  @amount = 100

	  customer = Stripe::Customer.create(
	    :email => 'info@chadxsmith.co',
	    :card  => params[:stripeToken]
	  )

	  
	  # binding.pry
	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
# end
end
