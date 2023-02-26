class TopPagesController < ApplicationController
  skip_before_action :require_login
  before_action :target_age_all
  before_action :category_all

  def top; end
end
