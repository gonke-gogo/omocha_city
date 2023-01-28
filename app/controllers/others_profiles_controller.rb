class OthersProfilesController < ApplicationController
  before_action :category_all, only: %i[show]
  
  def show
    @user = User.find(params[:id])
  end

  private 

  def category_all
    @category_all = Category.all
  end
end
