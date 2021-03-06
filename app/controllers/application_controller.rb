class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!, :except => ['inicio', 'ayuda', 'acerca', 'contacto']
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
    redirect_to :back, :alert => exception.message
  end

  protected
    def after_sign_in_path_for(resource)
      cookies[:mi_vista] = false
      root_path
    end
end
