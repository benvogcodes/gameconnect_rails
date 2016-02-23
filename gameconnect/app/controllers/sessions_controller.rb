class SessionsController < ApplicationController
  def new
    render 'login'
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user.authenticate
      session[:user_id] = @user.id
    else
      @form_error = "Username or password is invalid."
    end
  end

  def destroy
  end
end
