class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_filter :configure_permitted_parameters, if: :devise_controller?

 def default_api_value
      t("#{service_name}.#{service_action}", :default => {})
    end

    def service_name
      params[:controller].gsub(/^.*\//, "")
    end

    def service_action
      params[:action]
    end
    helper_method :service_action, :service_name


protected


	def configure_permitted_parameters
	  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :first_name, :last_name, :profile_name, :password, :password_confirm, :user_id, :title, :subtitle, :description, :goal) }
	end

end


 
    



