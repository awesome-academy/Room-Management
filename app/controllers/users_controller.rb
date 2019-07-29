class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :load_user, except: %i(new create index)
  before_action :admin_user, except: %i(show)

  def index
    @users = User.page(params[:page]).per(Settings.paging_table).ordered_by_name
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "success"
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t ".success"
      redirect_to @user
    else
      render :edit
    end
  end 

  def show; end

  def destroy
    if @user.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "fail"
    end
    redirect_to users_url
  end


  private
  def user_params
    params.require(:user).permit User::USER_PARAMS
  end

  def load_user
    @user = User.find_by_id params[:id]
    return if @user
    flash[:danger] = t "fail"
    redirect_to root_path
  end
end
