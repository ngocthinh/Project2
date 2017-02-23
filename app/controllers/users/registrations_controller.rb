class Users::RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    params.require(:user).permit :name, :user_name, :email, :position, :biography, :password,
      :password_confirmation
  end
end
