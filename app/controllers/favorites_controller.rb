class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    current_user.favorite(@post)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: [
        turbo_stream.replace("favorite_button_#{@post.id}", partial: "posts/favorite_button", locals: { post: @post }),
        turbo_stream.replace("favorite_count_#{@post.id}", partial: "posts/favorite_count", locals: { post: @post }),
      ] }  
      format.html { redirect_back fallback_location: request.referer, success: 'お気に入りに追加しました' }
    end
  end

  def destroy
    @post = current_user.favorites.find(params[:id]).post
    current_user.unfavorite(@post)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: [
        turbo_stream.replace("favorite_button_#{@post.id}", partial: "posts/favorite_button", locals: { post: @post }),
        turbo_stream.replace("favorite_count_#{@post.id}", partial: "posts/favorite_count", locals: { post: @post }),
      ] }     
      format.html { redirect_back fallback_location: request.referer, success: 'お気に入りを解除しました' }
    end
  end
end
