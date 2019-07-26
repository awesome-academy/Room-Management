class UsersController < ApplicationController
  USER_PARAMS = %i(name phone idCart email count password password_confirmation).freeze
  before_action :logged_in_user, except: %i(new create)
  before_action :load_user, except: %i(new create index)
  before_action :admin_user, except: %i(show)

  def index
    @users = User.page(params[:page]).per(Settings.pagetion)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t("oke")
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def load_user
    @user = User.find_by_id params[:id]
    return if @user
    flash[:danger] = t(".not_exits")
    redirect_to root_path
  end
end
