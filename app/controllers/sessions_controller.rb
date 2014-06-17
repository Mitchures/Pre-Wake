class SessionsController < ApplicationController

  def new
  end

  def create
    # auth = request.env["omniauth.auth"]
    # user = User.find_by_uid(auth["uid"]) || User.create_with_omniauth(auth)
    # session[:user_id] = user.uid
    # redirect_to root_url, :notice => "Signed in!"
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
      # Sign the user in and redirect to the user's show page.
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
    # session[:user_id] = nil
    # redirect_to root_url, :notice => "Signed out!"
  end
end
