class Auth::RegistrationsController < Devise::RegistrationsController
  
  skip_before_action :authenticate_user!
  
  def create
    if verify_captcha(params[:user][:recaptcha])
      build_resource(sign_up_params)
      resource.save

      unless resource.persisted?
        render json: {
          msg: resource.errors.full_messages.first,
          errors: resource.errors,
        }, status: 403
      else
        sign_up(resource_name, resource)
        
        render json: {
          msg: "Вы успешно зарегистрировались!",
          current_user: current_user.as_json
        }
      end
    else
      render json: {msg: "Проверка каптчи не пройдена"}, status: 422
    end
  end
  private
    def sign_up_params
      params.require(:user).permit(:name, :email, :password)
    end
end
