class TopPagesController < ApplicationController
  skip_before_action :require_login

  def top
    @target_age_all = TargetAge.all
    @category_all = Category.all
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @posts = @category.posts.includes([:user, :categories, :target_ages]).order(created_at: :desc).page(params[:page])
    elsif params[:target_age_id]
      @target_age = TargetAge.find(params[:target_age_id])
      @posts = @target_age.posts.includes([:user, :target_ages]).order(created_at: :desc).page(params[:page])
    else
      @posts = Post.all.includes([:user, :categories, :target_ages]).order(created_at: :desc).page(params[:page])
    end
  end
end
