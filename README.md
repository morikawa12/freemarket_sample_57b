# 要旨
プログラミングスクールTECH::EXPERTの最終課題で某フリーマーケットサービスのクローンサイトを作成しました。約2ヶ月間、４人チームでアジャイル開発を行いました。

# アプリケーション概要
### 接続先情報    
URL http://52.193.209.45/    
・ID: admin  
・Pass: 2222  
・テスト用アカウント等  
　- 購入者用  
　　メールアドレス:  hogehoge@gmail.com  
　　パスワード: hogehoge21  
　購入用カード情報  
 　　番号：4242424242424242  
 　　期限：03/20  
 　　ユーザー名：hogehoge21  
 　　セキュリティコード：333  
　- 出品者用  
 　　メールアドレス名: guest@gmail.com  
 　　パスワード: Guest2222  

### ドメイン/SSLサーバー証明書未取得のためFacebook, GoogleのSNS認証は使用不可


# 使用環境
Ruby 2.5.1
Ruby on Rails 5.2.3

## ER図
https://gyazo.com/4ebdf971b6584a9b719a2bc50a0603ab

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index, unique: true|
|email|string|null: false, add_index, unique: true|
|password|string|null: false|

### Association
- has_one :profile, dependent: :destroy
- has_one :address, dependent: :destroy
- has_one :card, dependent: :destroy
- has_many :items, through: :deals
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :user_evaluations, dependent: :destroy
- has_many :buyer_deals, class_name: 'Deal', foreign_key: :buyer_id, dependent: :destroy
- has_many :seller_deals, class_name: 'Deal', foreign_key: :seller_id, dependent: :destroy

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|mobile_phone|string|null: false, unique: true|
|profile_image|text|null: true|
|profile_content|text|null: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, inverse_of: :profile, optional: true

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|references|null: false, foreign_key: true|
|card_id|references|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, optional: true

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zip_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|null: true|
|home_phone|string|n
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, inverse_of: :address, optional: true
- belongs_to_active_hash :prefecture


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
|price|integer|null: false|
|description|text|null: false|
|status|integer|null: false|
|prefecture|integer|null: false|
|fee|integer|null: false|
|shipping|integer|null: false|
|arrival|integer|null: false|
|like|integer|null: false|
|brand_id|references|null: false, foreign_key: true|
|size_id|references|null: false, foreign_key: true|
|first_category_id|references|null: false, foreign_key: true|
|second_category_id|references|null: false, foreign_key: true|
|third_category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :size
- belongs_to :brand
- belongs_to :category
- has_many :images, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :buyer_deals, class_name: 'Deal', foreign_key: :buyer_id, dependent: :destroy
- has_many :seller_deals, class_name: 'Deal', foreign_key: :seller_id, dependent: :destroy
- has_many :seller, class_name: 'User', foreign_key: :seller_id, through: :deals
- has_many :buyer, class_name: 'User', foreign_key: :buyer_id, through: :deals

### enum
- status
- prefecture
- fee
- shipping
- arrival

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|string|null: false|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item

## dealsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|

### Association
- has_one :rate
- belongs_to :item
- belongs_to :seller, class_name: 'User', foreign_key: :seller_id
- belongs_to :buyer, class_name: 'User', foreign_key: :buyer_id

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|add_index|

### Association
- has_many :sizes
- has_many :items

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :category
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image_url|string|null: false|

### Association
- belongs_to :item
