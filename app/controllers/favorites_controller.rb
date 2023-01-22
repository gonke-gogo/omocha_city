class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    redirect_back fallback_location: request.referer, success: "お気に入りに追加しました"
  end

  def destroy
    post = current_user.favorites.find(params[:id]).post
    current_user.unfavorite(post)
    redirect_back fallback_location: request.referer, success: "お気に入りを解除しました"
  end
end
