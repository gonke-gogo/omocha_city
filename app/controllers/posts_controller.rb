class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index]
  before_action :set_post, only: %i[edit destroy update]
  before_action :category_all, only: %i[index new show edit favorites]
  
  def index
    @categories = Category.all
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @posts = @category.posts.includes([:user, :categories]).order(created_at: :desc)
    else
      @posts = Post.all.includes([:user, :categories]).order(created_at: :desc)
    end
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: "おもちゃが投稿されました！"
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, success: "投稿を編集しました。"
    else
      flash.now[:error] = '編集に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    respond_to do |format|
      format.html { redirect_to posts_path, warning: "投稿を削除しました", status: :see_other }
      format.json { head :no_content }
    end
  end

  def favorites
    @favorite_posts = current_user.favorite_posts.includes(:user).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(:toy_name, :content, :toy_image, :toy_image_cache, :toy_movie, category_ids: [])
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def category_all
    @category_all = Category.all
  end
end
