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

    it '詳細画面にて、ランダムに類似したおもちゃが表示されること' do
      visit post_path(@post)
      expect(page).to have_content(@related_post.toy_name)
      expect(page).to have_selector("img[src$='#{@related_post.toy_image.url}']")
    end
  end

  describe '投稿機能' do
    before do
      login_as(@user)
      visit new_post_path 
    end
    context "正しく値が入力された場合" do
      it "投稿ができる" do
        fill_in 'おもちゃの名前', with: 'Created toy name'
        fill_in '本文', with: 'Created content'
        click_button '投稿する'
        expect(page).to have_content('おもちゃが投稿されました！')
        expect(page).to have_content('Created toy name')
        expect(page).to have_content('Created content')
      end
    end
    
    context "必須項目が入力されなかった場合" do
      it "投稿に失敗する" do
        fill_in 'おもちゃの名前', with: ''
        fill_in '本文', with: ''
        click_button '投稿する'
        expect(page).to have_content('投稿に失敗しました')
        expect(page).to have_content('おもちゃの名前を入力してください')
        expect(page).to have_content('本文(特徴や使い方、感想などを書いてください！)を入力してください')
      end
    end
  end

  describe '投稿の編集' do
    before do
      login_as(@user)
      visit edit_post_path(@post)
    end

    context "正しく値が入力された場合" do
      it '投稿が編集できる' do
        fill_in 'おもちゃの名前', with: 'Updated toy name'
        fill_in '本文', with: 'Updated content'
        click_button '投稿する'
        expect(page).to have_content('投稿を編集しました')
        expect(page).to have_content('Updated toy name')
        expect(page).to have_content('Updated content')
      end
    end

    context "必須項目が入力されていなかった場合" do
      fit '投稿に失敗する' do
        fill_in 'おもちゃの名前', with: ''
        fill_in '本文', with: ''
        click_button '投稿する'
        expect(page).to have_content('おもちゃの名前を入力してください')
        expect(page).to have_content('本文(特徴や使い方、感想などを書いてください！)を入力してください')
      end
    end
  end
end