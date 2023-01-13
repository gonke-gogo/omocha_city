class PostsController < ApplicationController
  skip_before_action :require_login, only: [:index]
  def index
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
