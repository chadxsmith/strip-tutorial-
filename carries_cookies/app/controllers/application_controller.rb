class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :widgets

  def widgets
  	{w1: {
  		    name: "Basic",
  		    description: "Basic Description",
  		    amount: 3000,
  		    extras: 3
  		},
  	w2: {
  		    name: "Popular",
  		    description: "Popular Description",
  		    amount: 6000,
  		    extras: 6
  		},
  	w3: {
  		    name: "Premier",
  		    description: "Premier Description",
  		    amount: 9000,
  		    extras: 9
  		}}
  end
end
