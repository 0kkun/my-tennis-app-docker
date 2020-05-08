# README


# About this application
### 名称
- Tennis app

### 概要
- ユーザーの好みに合わせてテニスの情報をまとめることができるアプリ
- お気に入り選手を登録することでニュース・動画を一覧表示する
- 大会情報・ランキングを他サイトからスクレイピングして表示する

### 本番環境
- デプロイ先：Heroku
- 
- ID : test@email.com / PASS : test1234

### 制作背景(意図)
- 色々なサイトにアクセスして情報を集める手間を省き、効率化するため

### 工夫したポイント
- apiを用いて情報を検索・取得できるようにした


### 使用技術
- Ruby on Rails 5.2.4.1
- ruby 2.5.1p57
- MySQL 5.6.46 Homebrew
- google api
- scraping
- jQuery

### 今後実装したい機能
- お気に入りブランド登録機能
- ブランドに基づいて動画を表示する機能


### Demo
https://gyazo.com/8270fa200c6da3871c412cac92df8919


##  DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :messages
- has_many :players
- has_many :brands


## playersテーブル
|Column|Type|Options|
|------|----|-------|
|player_name|string|unique: true|
|player_name_jp|string|unique: true|
|player_name_etc|string|unique: true|
|player_name_search_1|string|unique: true|
|player_name_search_2|string|unique: true|
### Association
- has_many :users, through: :favorites
- has_many :player_users


## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand_name_en|string|unique: true|
|brand_name_jp|string|unique: true|
|brand_name_etc|string|unique: true|
### Association
- has_many :users, through: :brand_users
- has_many :brand_users


## favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|player_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :users
- belongs_to :players


## brand_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :users
- belongs_to :brands

