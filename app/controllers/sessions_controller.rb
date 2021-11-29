class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # sessions uses cookies for each store https://guides.rubyonrails.org/v4.1.4/action_controller_overview.html#session
      session[:user_id] = user.id
      flash[:notice] = "Logged in successfully"
      redirect_to user
    else
      flash.now[:alert] = "There was somthing wrong with your login details."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "User logged out"
    redirect_to root_path
  end
end