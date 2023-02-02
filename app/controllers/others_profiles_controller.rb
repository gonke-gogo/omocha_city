class OthersProfilesController < ApplicationController
  skip_before_action :require_login, only: %i[show others_post]
  before_action :category_all, only: %i[show edit others_post]
  before_action :target_age_all, only: %i[show edit others_post]
  before_action :set_search, only: %i[show edit others_post]
  before_action :set_user, only: %i[show others_post]
  
  def show; end

  def others_post
    @posts = @user.posts.page(params[:page])
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
