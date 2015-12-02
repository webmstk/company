class SessionsController < ApplicationController
  skip_after_action :verify_authorized

  def new
  end

  def create
    user = User.find_by_login(params[:login])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Вход успешно выполнен'
    else
      flash.now.alert = 'Неправильный логин/пароль'
      render :new
    end
  end

  def destroy
    # session[:user_id] = nil
    session.delete(:user_id)
    redirect_to root_path, notice: 'Выход выполнен успешно'
  end
end