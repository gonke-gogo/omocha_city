require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user: @user)
    login_as(@user)
  end

  fit 'おもちゃが正しく表示される' do
    visit posts_path
    expect(page).to have_content(@post.toy_name)
    expect(page).to have_content(@post.content)
  end
end