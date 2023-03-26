class TopPagesController < ApplicationController
  skip_before_action :require_login
  before_action :target_age_all
  before_action :category_all

  def top
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
  end
end
