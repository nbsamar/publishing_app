class RegistrationsController < Devise::RegistrationsController

  def index

  end

  def create
    User.create!(user_create_params)
  end

  private

  def user_create_params
    params.require(:user).permit(:first_name, :last_name, :email, :role,
                                 :password, :password_confirmation)
  end

end
