# class StripeService
#   def create_customer(email, token)
#       customer = Stripe::Customer.create(
#         :email => email,
#         :card  => token
#       )
#   end
  
#   def charge_customer(customer_id, amount, description: "Payment made on our platform with Stripe", currency: "usd")
#     Stripe::Charge.create(
#       :customer    => customer_id,
#       :amount      => amount,
#       :description => description,
#       :currency    => currency
#     )
#   end
# end