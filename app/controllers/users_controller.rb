class UsersController < ApplicationController
  before_action :require_user_logged_in?, only: [:index, :show]
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザ登録しました'
      redirect_to @user
    else
      flash[:danger] = 'ユーザの登録に失敗しました'
      render :new
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
