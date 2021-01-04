class ApplicationController < ActionController::Base
    before_action :basic_auth
    before_action :configure_permitted_parameters, if: :devise_controller?

    # def new
    # end

    # def create
    #   @user = User.new(sign_up_params)
    #   if @user.save
    #     redirect_to root_path
    #   end
    # end  


    
    private

    # def sign_up_params
    # params.require(:user).permit(:nicname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday)
    # end
  
  
    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
    end
end
