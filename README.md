# テーブル設計

## users テーブル
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| nickname           | string     | null: false                  |
| email              | string     | null: false  unique: true    |
| encrypted_password | string     | null: false                  |
| family_name        | string     | null: false                  |
| last_name          | string     | null: false                  |
| family_name_kana   | string     | null: false                  |
| last_name_kana     | string     | null: false                  |
| birth_date         | date       | null: false                  |
### Association
- has_many :items
- has_many :orders

## addresses  テーブル
| Column             | Type       | Options                           |
| ------------------ | -----------| --------------------------------- |
| post_code          | string     | null: false                       |
| prefectures_id     | integer    | null: false                       |
| city               | string     | null: false                       |
| addresses          | string     | null: false                       |
| building_name      | string     |                                   |
| phone_number       | integer    | null: false                       |
| order              | references | null: false  foreign_key: true   |
### Association
- belongs_to :order 



## items テーブル
| Column               | Type       | Options                         |
| ------------------   | -----------| ------------------------------- |
| name                 | string     | null: false                     |
| detail               | text       | null: false                     |
| item_category_id     | integer    | null: false                     |
| item_condition_id    | integer    | null: false                     |
| shipping_charge_id   | integer    | null: false                     |
| prefectures_id       | integer    | null: false                     |
| days_to_ship_id      | integer    | null: false                     |
| price                | integer    | null: false                     |
| user                 | references | null: false foreign_key: true   |
### Association
- has_one  :order
- belongs_to :user


##　 orders
| Column             | Type       | Options                          |
| ------------------ | -----------| ----------------------------     |
| user               | references | null: false foreign_key: true    |
| item               | references | null: false foreign_key: tru     |
### Association
- belongs_to:item
- belongs_to:user
- has_one: address