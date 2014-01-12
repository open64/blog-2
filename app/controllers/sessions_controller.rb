class SessionsController < ApplicationController
  before_filter :sign_out, :only => [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user_path user['id']
    else
      render 'new'
    end
  end

  def destroy
    current_user.update_attribute(:remember_token, User.encrypt(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
    redirect_to root_path
  end
end
