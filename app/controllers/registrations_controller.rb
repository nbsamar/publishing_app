class RegistrationsController < Devise::RegistrationsController

  def index

  end

  def create
    @user = User.create!(user_create_params)
    sign_in(@user) # post sign up, logs in the new user
    redirect_to articles_path
  end

  private

  def user_create_params
    params.require(:user).permit(:first_name, :last_name, :email, :role,
                                 :password, :password_confirmation)
  end

end
