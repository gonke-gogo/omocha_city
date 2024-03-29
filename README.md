# おもちゃシティー
![ogp](https://user-images.githubusercontent.com/93467227/231589581-05e3b096-6cfc-4672-a61d-9599f1750552.jpg)

## サービスURL  [https://www.omocha-city.site/](https://www.omocha-city.site/)

<br>

## サービス概要
- 子供に何かおもちゃを買ってあげたい人に
- 他の子供が使っているおもちゃの投稿を参考に
- 次に買ってみたいおもちゃを検索できるサービス

## メインターゲットのユーザー
- おもちゃで遊ぶ年齢の子供・孫がいる人
- 他の子供がどのようなおもちゃを使っているか知って、それを購入の参考にしたい人
- 自分の子供が使っているおもちゃを他のパパママにも共有したい人

## ユーザーが抱える問題
- おもちゃはたくさんの種類があるため、どのおもちゃがいいのか悩むことが多い。
- 年齢別、性別、シチュエーション別など、カテゴリーで検索できるものが少ない。
- いろんなおもちゃの口コミがまとめて載ってるサービスが少ない。

## 解決方法
- おもちゃの使い方や遊んでいる風景がわかる投稿を見ることができるようにする。
- カテゴリー別でおもちゃを検索できるようにする
  
## サービスを作った背景
- 子供系のサービスで、おもちゃの口コミを見やすくまとめたものがあまりないと思ったため。
- 子供がおもちゃを使っている様子など、生の感想が聞けるサービスが少ないと感じたため。
- おもちゃを探す際に、自分の子供の属性に合ったものを探せるようにしたいと感じたため。
- 自分の子供が使っているおもちゃを他のパパママにも知ってもらって、楽しく子育てができる一助になればと感じたため。

## 主な機能

### トップ画面について
![トップ画面の紹介](https://user-images.githubusercontent.com/93467227/231713229-a7dff81a-4f48-475f-bdb9-b65ccef3e6eb.gif)
* サービスの使い方、最新記事、投稿されたおもちゃのランキングが載っています。

### 一覧画面への遷移
![一覧画面へ (1)](https://user-images.githubusercontent.com/93467227/231708992-4ac32097-bd12-4d3f-b921-a3a8ab7b84bc.gif)
<br>
* 投稿されたおもちゃ一覧が表示されます。 
* カテゴリー・対象年齢での検索ができます。
* おもちゃの名前・詳細内容にてキーワード検索ができます。

### 詳細画面について
![詳細画面（ランダム表示） (1)](https://user-images.githubusercontent.com/93467227/231710150-94ba5d7d-b8c7-491d-9a12-74f5ea1904d7.gif)
* おもちゃの写真・動画、詳細の本文、カテゴリー、対象年齢、楽天市場へのリンクなどが掲載されています。
* ページ下方には、類似するジャンルの商品がランダムで表示されています。

### 投稿
![投稿の流れ](https://user-images.githubusercontent.com/93467227/231711595-acee4fa3-4761-41d2-919b-4bc12546c8fd.gif)
* 右下に表示されている投稿ボタンから投稿入力画面に遷移できます。
* 「楽天市場で商品を検索する」ボタンで投稿したいおもちゃを検索できます(任意)

### その他の機能
#### ログイン前
* ログイン機能
* 利用規約・プライバシーポリシーの閲覧
* お問い合わせ
* プロフィール閲覧
#### ログイン後
* フォロー機能
* お気に入り機能
* コメント機能
* 投稿編集機能
* Twitterシェア機能

## 使用している技術 
### バックエンド
- Ruby 3.2.0
- Rails 7.0.4
### フロントエンド
- Javascript
- Tailwind CSS -daisyUI
### 使用したAPI
- 楽天市場商品検索API
### インフラ
- Heroku
- AWS(S3)

## テーブル設計・ER図
![](https://i.gyazo.com/bfbac2e65e1b8538bde9b11d4b3367b5.jpg)
