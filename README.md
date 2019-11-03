# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## ER図
https://gyazo.com/564cfa58402f3b12f5b500ff822082aa

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index, unique: true|
|email|string|null: false, add_index, unique: true|
|password|string|null: false|

### Association
- has_one :profile, dependent: :destroy
- has_one :address, dependent: :destroy
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
|card_number|string|null: true|
|expiration_month|string|null: true|
|expiration_year|string|null: true|
|security_code|string|null: true|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, inverse_of: :profile, optional: true

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|relative_family_name|string|null: false|
|relative_first_name|string|null: false|
|relative_family_name_kana|string|null: false|
|relative_first_name_kana|string|null: false|
|zip_code|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|null: true|
|home_phone|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user, inverse_of: :address, optional: true
- belongs_to_active_hash :prefecture

## user_evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|integer|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true

### Association
- belongs_to :deal
- belongs_to :rater, class_name: 'User'
- belongs_to :ratee, class_name: 'User'

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
- belongs_to :first_category
- belongs_to :second_category
- belongs_to :third_category
- belongs_to :size
- belongs_to :brand
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

## first_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|

### Association
- has_many :items
- has_many :second_categories

## second_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|first_category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :first_category
- has_many :items
- has_many :third_categories

## third_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category_name|string|null: false|
|second_category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :second_category
- has_many :items
- has_many :sizes

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|third_category_id|references|null: false, foreign_key: true|

### Association
- belongs_to :third_category
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand-name|string|null: false|

### Association
- has_many :items

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|image-url|string|null: false|

### Association
- belongs_to :item