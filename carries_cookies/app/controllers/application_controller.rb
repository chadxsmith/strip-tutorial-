class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :widgets

  def widgets
  	{w1: {
  		    name: "Basic",
  		    description: "Basic Booking Package",
  		    amount: 0000,
  		    extras: 4
  		},
  	w2: {
  		    name: "Popular",
  		    description: "Popular Booking Package",
  		    amount: 0000,
  		    extras: 8
  		},
  	w3: {
  		    name: "Premier",
  		    description: "Premier Booking Package",
  		    amount: 0000,
  		    extras: 12
  		}}
  end
end
