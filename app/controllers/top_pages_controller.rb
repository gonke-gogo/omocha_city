class TopPagesController < ApplicationController
  skip_before_action :require_login
  before_action :category_all

  def top
    @categories = Category.all
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @posts = @category.posts.includes([:user, :categories]).order(created_at: :desc).page(params[:page])
    else
      @posts = Post.all.includes([:user, :categories]).order(created_at: :desc).page(params[:page])
    end
  end

  private

  def category_all
    @category_all = Category.all
  end
end
