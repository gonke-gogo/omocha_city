class UserSessionsController < ApplicationController
  def new; end

  def create 
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to posts_path, success: 'ログインしました'
    else
      flash.now[:danger]= 'ログインに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, success: 'ログアウトしました'
  end
end
