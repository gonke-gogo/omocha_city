require 'rails_helper'

RSpec.describe 'UserSessions', type: :system do
  let(:user) { create(:user) }

  describe 'ログインページの表示' do
    it 'ログインページが正常に表示されること' do
      visit login_path
      expect(page).to have_content 'ログイン'
    end
  end

  describe 'ログイン処理' do
    before do
      visit login_path
    end

    context '正しいログイン情報が渡された場合' do
      it 'ユーザーがログインし、投稿一覧ページに遷移する' do
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました'
        expect(current_path).to eq posts_path
      end
    end

    context '間違ったログイン情報が渡された場合' do
      it 'ログインに失敗し、エラーメッセージが表示' do
        fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: 'wrong_password'
        click_button 'ログイン'
        expect(page).to have_content 'ログインに失敗しました'
        expect(current_path).to eq login_path
      end
    end

  end

end