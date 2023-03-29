class PostsController < ApplicationController
  skip_before_action :require_login, only: %i[index show]
  before_action :set_post, only: %i[edit destroy update]
  before_action :category_all, only: %i[index new show edit create favorites myselfs]
  before_action :target_age_all, only: %i[index new show edit create favorites myselfs]

  def index; end

  def new
    @post = Post.new
    # posts/newへのURI直打ちを制限
    return unless params[:toy].present?

    @rakuten_name = params[:toy]['itemName']
    @rakuten_url = params[:toy]['itemUrl']
    @rakuten_image = params[:toy]['mediumImageUrls'][0]
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: 'おもちゃが投稿されました！'
    else
      flash.now[:danger] = '投稿に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
    same_category_posts = @post.categories.flat_map { |category| category.posts.where.not(id: @post.id) }
    same_age_posts = @post.target_ages.flat_map { |target_age| target_age.posts.where.not(id: @post.id) }
    combined_posts = (same_category_posts + same_age_posts).uniq
    @random_post = combined_posts.sample
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, success: '投稿を編集しました。'
    else
      flash.now[:error] = '編集に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    respond_to do |format|
      format.html { redirect_to posts_path, warning: '投稿を削除しました', status: :see_other }
      format.json { head :no_content }
    end
  end

  def favorites
    @q = current_user.favorite_posts.ransack(params[:q])
    @favorite_posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def myselfs
    @myselfs = current_user.posts.includes(:user).order(created_at: :desc).page(params[:page])
  end

  private

  def post_params
    params.require(:post).permit(:toy_name, :content, :toy_image, :toy_image_cache, :toy_movie, :shop_link,
                                 :netshop_link, :rakuten_toyname, :rakuten_toyimage, category_ids: [], target_age_ids: [])
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def new_post_access
    return if @rakuten_name.present?

    redirect_to toys_search_path, warning: '投稿したいおもちゃを検索してください'
  end
end
