class UsersController < ApplicationController
  def new
    session[:current_time] = Time.now
    @user = User.new
  end

  def create
    users_params = params.require(:user).permit(:name, :nickname, :email, :password)
    @user = User.create(users_params)
    session[:user_id] = @user.id
    redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
  end
end
