class EditorsController < ApplicationController
  before_action :authenticate_user!

  def create
    User.create(editor_params.merge(role: 1))
    redirect_to root_path
    flash[:success] = 'Editor Created'
  end

  private

  def editor_params
    params.permit(:first_name, :last_name, :email,
                  :password, :password_confirmation)
  end
end
