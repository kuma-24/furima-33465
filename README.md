# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| birth-date      | date   | null: false |
| last-name       | string | null: false |
| first-name      | string | null: false |
| last-name-kana  | string | null: false |
| first-name-kana | string | null: false |

### Association

- has_many :items
- has_many :orders



## items テーブル

| Column                   | Type          | Options                        |
| ------------------------ | ------------- | ------------------------------ |
| item-name                | text          | null: false                    |
| item-image               | ActiveStorage | null: false                    |
| item-info                | text          | null: false                    |
| item-price               | integer       | null: false                    |
| item-genre               | references    | null: false, foreign_key: true |
| user                     | references    | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item_genre
- bas_one    :order



## item_genres テーブル

| Column                   | Type       | Options                        |
| ------------------------ | ---------- | ------------------------------ |
| item-category            | ActiveHash | null: false                    |
| item-sales-status        | ActiveHash | null: false                    |
| item-shipping-fee-status | ActiveHash | null: false                    |
| item-scheduled-delivery  | ActiveHash | null: false                    |
| prefecture_genre         | references | null: false, foreign_key: true |

### Association

- has_many   :items
- has_one    :prefecture_genre



## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| shipping_address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :shipping_address



## shipping_addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal-code      | string     | null: false                    |
| city             | string     | null: false                    |
| addresses        | string     | null: false                    |
| building         | string     | null: false                    |
| phone-number     | string     | null: false                    |
| prefecture_genre | references | null: false, foreign_key: true |

### Association

- has_many :orders
- has_one  :prefecture_genre



## prefecture_genres

| Column     | Type       | Options |
| ---------- | ---------- | ------- |
| prefecture | ActiveHash |         |
 
### Association

- belongs_to :item_genre
- belongs_to :shipping_address
