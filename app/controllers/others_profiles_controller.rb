class OthersProfilesController < ApplicationController
  before_action :category_all, only: %i[show edit]
  before_action :target_age_all, only: %i[show edit]
  before_action :set_search, only: %i[show edit]
  
  def show
    @user = User.find(params[:id])
  end
end
