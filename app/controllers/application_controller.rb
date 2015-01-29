class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  public def nav_link_to(name, controller)
    #create <li class="active"><%= link_to 'Home', controller:  'welcome'%></li>
  end
end
