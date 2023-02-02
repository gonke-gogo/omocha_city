class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :category_all, only: %i[new followings followers]
  before_action :target_age_all, only: %i[new followings followers]
  before_action :set_search, only: %i[new followings followers]
  before_action :set_user, only: %i[followings followers]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, success: '登録が完了しました。'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def followings
    @users = @user.following_users
  end

  def followers
    @users = @user.follower_users
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
