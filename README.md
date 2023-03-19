# テーブル設計

## users テーブル
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| nickname           | string     | not null                     |
| email              | string     | not null unique: true        |
| encrypted_password | string     | not null                     |
| family_name        | string     | not null                     |
| last_name          | string     | not null                     |
| family_name_kana   | string     | not null                     |
| last_name_kana     | string     | not null                     |
| birth_date         | date       | not null                     |
### Association
- has_many :items
- has_many :orders

## address  テーブル
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| post_code          | integer    | not null                     |
| prefectures_id     | integer    | not null                     |
| city               | string     | not null                     |
| building_name      | string     | not null                     |
| phone_number       | integer    | not null                     |
| orders             | references | not null foreign_key: true   |
### Association
- belongs_to :order 



## items テーブル
| Column               | Type       | Options                      |
| ------------------   | -----------| ---------------------------- |
| name                 | string     | not null                     |
| detail               | text       | not null                     |
| item_category_id     | integer    | not null                     |
| item_condition_id    | integer    | not null                     |
| shipping_charge_id   | integer    | not null                     |
| region_of_origin_id  | integer    | not null                     |
| days_to_ship_id      | integer    | not null                     |
| price                | integer    | not null                     |
| users             | references | not null foreign_key: true   |
### Association
- has_one  :order
- belongs_to :user


##　 orders
| Column             | Type       | Options                          |
| ------------------ | -----------| ----------------------------     |
| users              | references | not null foreign_key: true       |
| items              | references | not null foreign_key: true       |
### Association
- belongs_to:item
- belongs_to:user
- has_one: address