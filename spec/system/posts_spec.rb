require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
    @category = FactoryBot.create(:category)
    @target_age = FactoryBot.create(:target_age)
    @post.categories << @category
    @post.target_ages << @target_age

    @related_post = FactoryBot.create(:post, user: @user)
    @related_post.categories << @category
    @related_post.target_ages << @target_age
    login_as(@user)
  end

  describe '画面表示' do
    before do
      visit posts_path
    end

    it '一覧画面におもちゃが正しく表示される' do
      expect(page).to have_content(@post.toy_name)
      expect(page).to have_content(@post.content)
    end
    
    it '一覧ページから詳細ページへの移動' do
      click_on @post.toy_name
      expect(page).to have_content(@post.toy_name)
      expect(page).to have_content(@post.content)
    end

    fit '詳細画面にて、ランダムに類似したおもちゃが表示されること' do
      visit post_path(@post)
      expect(page).to have_content(@related_post.toy_name)
      expect(page).to have_selector("img[src$='#{@related_post.toy_image.url}']")
    end
  end
end