class StripeService
  def create_customer(email, token, description)
    Stripe::Customer.create(email: email, description: description, card: token)
  end

  def charge_customer(customer_id, plan_id, coupon = nil)
    subscribe_params = {customer: customer_id, plan: plan_id}
    subscribe_params[:coupon] = coupon if coupon.present?
    Stripe::Subscription.create(subscribe_params)
  end
end
