class ProfilesController < ApplicationController
  before_action :set_user, only: %i[edit update]
  before_action :category_all, only: %i[show edit]
  before_action :target_age_all, only: %i[show edit]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, success: 'プロフィールを編集しました。'
    else
      flash.now[:danger] = 'プロフィールの編集に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name, :introduction, :avatar, :avatar_cache)
  end
end
