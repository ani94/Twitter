class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login(user)
      redirect_to posts_path
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "invalid"
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path
  end

end
