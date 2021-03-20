class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  private

  def users_params
    params.require(:user).permit(:nickname, :email, :encrypted_password).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
end
