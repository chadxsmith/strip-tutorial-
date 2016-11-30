class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :widgets, :widgets_for_subscribers

  def widgets
  	{w1: {
  		    name: "Basic",
  		    description: "Basic Booking Package",
          stripe_id: "basic",
  		    amount: 3000,
  		    extras: 15,
          categoriesCount: 1,
          categoriesDescription: " Themes"
  		},
  	w2: {
  		    name: "Popular",
  		    description: "Popular Booking Package",
          stripe_id: "popular",
  		    amount: 5000,
  		    extras: 30,
          categoriesCount: 2,
          categoriesDescription: " Themes"
  		},
  	w3: {
  		    name: "Premier",
  		    description: "Premier Booking Package",
          stripe_id: "premier",
  		    amount: 7500,
  		    extras: 60,
          categoriesCount: 3,
          categoriesDescription: " Themes"
  		}}
  end

  def widgets_for_subscribers
    {w1: {
          name: "Basic",
          description: "Basic Booking Package",
          stripe_id: "basic",
          amount: 3000,
          extras: 15,
          categoriesCount: 1,
          categoriesDescription: " Themes",
          coupon_id: "thirty_bucks_discount"
      },
    w2: {
          name: "Popular",
          description: "Popular Booking Package",
          stripe_id: "popular_60",
          amount: 6000,
          extras: 30,
          categoriesCount: 2,
          categoriesDescription: " Themes",
          coupon_id: "sixty_bucks_discount"
      },
    w3: {
          name: "Premier",
          description: "Premier Booking Package",
          stripe_id: "premier_90",
          amount: 9000,
          extras: 90,
          categoriesCount: 3,
          categoriesDescription: " Themes",
          coupon_id: "ninty_bucks_discount"
      }}
  end
end
