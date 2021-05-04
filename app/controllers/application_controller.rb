class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected


  def after_sign_out_path_for(resource)
   root_path
  end

  def application
     @customer = current_customer
  end



  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path(resource)
    when Customer
     public_items_path(resource)
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:first_name,:last_name_kana,:last_name,:first_name_kana,:address,:postal_code,:email,:telephone_number,:is_deleted])
  end
end
