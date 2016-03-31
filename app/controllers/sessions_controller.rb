class SessionsController < ApplicationController
  before_action :require_logged_out!, only: [:new]
  before_action :require_current_user!, only: [:destroy]

  def new
  end

  def create
    @user_login = User.find_by_credentials(params[:session][:user_name], params[:session][:password])
    if @user_login
      login!(@user_login)
      redirect_to root_url #user_login url
    else
      @user_login = User.new(user_name: params[:session][:user_name])
      flash.now[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    logout! if logged_in?
    redirect_to root_url
  end


end
