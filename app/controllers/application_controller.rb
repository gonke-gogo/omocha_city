class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login
  before_action :category_all
  before_action :target_age_all
  before_action :set_search

  private

  def not_authenticated
    redirect_to login_path, warning: 'ログインしてください'
  end

  def target_age_all
    @target_age_all = TargetAge.all
  end

  def category_all
    @category_all = Category.all
  end

  def set_search
    @q = Post.ransack(params[:q])
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @posts = @category.posts.includes(%i[user categories target_ages]).order(created_at: :desc).page(params[:page])
    elsif params[:target_age_id]
      @target_age = TargetAge.find(params[:target_age_id])
      @posts = @target_age.posts.includes(%i[user target_ages]).order(created_at: :desc).page(params[:page])
    else
      @posts = @q.result(distinct: true).includes(%i[user categories
                                                     target_ages]).order(created_at: :desc).page(params[:page])
    end
  end
end
