class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password]) 
      log_in user
      flash[:success] = t("login_page.login_success")
      redirect_back_or user
    else
      flash.now[:danger] = t "login_page.login_error"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
