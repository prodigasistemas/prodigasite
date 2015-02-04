class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def params_valid?
    return false  unless contact_params[:email] =~ /.+@.+/
    return false unless contact_params[:phone] =~ /[\d\-\(\)\s]+/
    true
  end
end
