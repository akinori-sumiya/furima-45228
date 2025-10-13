# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| password           | string | null: false               |
| nickname           | string | null: false, unique: true |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_reading  | string | null: false               |
| first_name_reading | string | null: false               |
| birth_date         | date   | null: false               |

Association

has_many :items
has_many :orders

## items テーブル

| Column Name           | Data Type      | Options                        |
| --------------------- | -------------- | ------------------------------ |
| user_id               | references     | null: false, foreign_key: true |
| image                 | Active Storage | null: false                    |
| name                  | string         | null: false                    |
| info                  | text           | null: false                    |
| category_id           | integer        | null: false                    |
| sales_status_id       | integer        | null: false                    |
| shipping_fee_payer_id | integer        | null: false                    |
| prefecture_id         | integer        | null: false                    |
| scheduled_delivery_id | integer        | null: false                    |
| price                 | integer        | null: false                    |

## orders テーブル

| Column  | Type       | Options                                      |
| ------- | ---------- | -------------------------------------------- |
| user_id | references | null: false, foreign_key: true               |
| item_id | references | null: false, foreign_key: true, unique: true |

Association

has_many :items
has_many :orders
has_one :address

## address

| Column        | Type       | Options                                      |
| ------------- | ---------- | -------------------------------------------- |
| order_id      | references | null: false, foreign_key: true, unique: true |
| postal_code   | string     | null: false                                  |
| prefecture_id | integer    | null: false                                  |
| city          | string     | null: false                                  |
| addresses     | string     | null: false                                  |
| building      | string     |                                              |
| phone_number  | string     | null: false                                  |

Association

belongs_to :order
