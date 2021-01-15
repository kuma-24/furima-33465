# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birth_date         | date   | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |

### Association

- has_many :items
- has_many :orders



## items テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| name                     | text       | null: false                    |
| info                     | text       | null: false                    |
| price                    | integer    | null: false                    |
| item_category            | ActiveHash | null: false                    |
| item_sales_status        | ActiveHash | null: false                    |
| item_shipping_fee_status | ActiveHash | null: false                    |
| item_scheduled_delivery  | ActiveHash | null: false                    |
| item_prefecture          | ActiveHash | null: false                    |
| user                     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item_genre
- bas_one    :order



## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address



## shipping_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| prefecture   | ActiveHash | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

- belongs_to :order

