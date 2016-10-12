class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :widgets

  def widgets
  	{w1: {
  		    name: "Basic",
  		    description: "Basic Booking Package",
  		    amount: 7500,
  		    extras: 4,
          categoriesCount: 1,
          categoriesDescription: " Theme (e.g. Outer Space)"
  		},
  	w2: {
  		    name: "Popular",
  		    description: "Popular Booking Package",
  		    amount: 15000,
  		    extras: 8,
          categoriesCount: 2,
          categoriesDescription: " Themes (e.g. Glitch & Grunge)"
  		},
  	w3: {
  		    name: "Premier",
  		    description: "Premier Booking Package",
  		    amount: 20000,
  		    extras: 12,
          categoriesCount: 3,
          categoriesDescription: " Themes (e.g. Halloween)"
  		}}
  end
end
