class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :widgets

  def widgets
  	{w1: {
  		    name: "Basic",
  		    description: "Basic Booking Package",
          stripe_id: "basic",
  		    amount: 3000,
  		    extras: 15,
          categoriesCount: 2,
          categoriesDescription: " Themes"
  		},
  	w2: {
  		    name: "Popular",
  		    description: "Popular Booking Package",
          stripe_id: "popular",
  		    amount: 5000,
  		    extras: 30,
          categoriesCount: 4,
          categoriesDescription: " Themes"
  		},
  	w3: {
  		    name: "Premier",
  		    description: "Premier Booking Package",
          stripe_id: "premier",
  		    amount: 7500,
  		    extras: 60,
          categoriesCount: 6,
          categoriesDescription: " Themes"
  		}}
  end
end
