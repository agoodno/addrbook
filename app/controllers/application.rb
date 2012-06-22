# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'a2ba1265173018b8d60bfe6699c81881'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  filter_parameter_logging :password
  
  include AuthenticatedSystem

  layout :determine_layout

  def determine_layout
    #puts "Controller=#{params[:controller]}"
    if params[:controller] != 'main' && params[:controller] != 'accounts' && (!(params[:controller] == 'users' && params[:action] == 'signup'))
      'admin'
    else
      'application'
    end
  end

end
