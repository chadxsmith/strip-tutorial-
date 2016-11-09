class StripeService
  def create_customer(email, token)
      customer = Stripe::Customer.create(
        :email => email,
        :card  => token
      )
  end
  
  def charge_customer(customer_id, plan_id)
    Stripe::Subscription.create(
      :customer    => customer_id,
      :plan => plan_id,
    )
  end
end