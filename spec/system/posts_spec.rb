require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
    login_as(@user)
  end

  describe '画面表示' do
    before do
      visit posts_path
    end

    fit '一覧画面におもちゃが正しく表示される' do
      expect(page).to have_content(@post.toy_name)
      expect(page).to have_content(@post.content)
    end
    
    fit '一覧ページから詳細ページへの移動' do
      click_on @post.toy_name
      expect(page).to have_content(@post.toy_name)
      expect(page).to have_content(@post.content)
    end
  end
end