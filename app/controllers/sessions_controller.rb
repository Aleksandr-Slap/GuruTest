class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new

  end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Добро пожаловать в GuruTest"
      redirect_to cookies[:first_path] || tests_path
    else
      flash.now[:alert] = "Не верный email или пароль! Введите email и пароль!"
      render :new 
    end 
  end

  def destroy
    session.destroy
    cookies.delete(:first_path)

    redirect_to login_path
  end  
end
