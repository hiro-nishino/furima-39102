# テーブル設計

## users テーブル
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| nickname           | string     | not null                     |
| email              | string     | null: UNIQUE                 |
| encrypted_password | string     | not null                     |
| family_name        | string     | not null                     |
| last_name          | string     | not null                     |
| family_name_kana   | string     | not null                     |
| last_name_kana     | string     | not null                     |
| phone_number       | integer    | not null                     |
| birth_year_id      | integer    | not null                     |
| birth_month_id     | integer    | not null                     |
| birth_day_id       | integer    | not null                     |
| credit_card_id     | references | not null foreign_key: true   |
| address_id         | references | not null foreign_key: true   |
### Association
- has_many :items
- has_many :comments
- has_many :orders
- belongs_to :birth_year
- belongs_to :birth_month
- belongs_to :birth_day

## address  テーブル
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| customer_id        | integer    | not null                     |
| days_of_expiry     | integer    | not null                     |
| cord_id            | integer    | not null                     |
| post_code          | integer    | not null                     |
| prefectures_id     | integer    | not null                     |
| city               | string     | not null                     |
| building_name      | string     | not null                     |
| orders             | references | not null foreign_key: true   |
### Association
- belongs_to :orders
- belongs_to :prefectures



## items テーブル
| Column               | Type       | Options                      |
| ------------------   | -----------| ---------------------------- |
| name                 | string     | not null                     |
| detail               | text       | not null                |
| explanation          | text       | not null                     |
| item_category_id     | integer    | not null                     |
| item_condition_id    | integer    | not null                     |
| shipping_charge_id   | integer    | not null                     |
| region_of_origin_id  | integer    | not null                     |
| days_to_ship_id      | integer    | not null                     |
| price                | integer    | not null                     |
| users_id             | references | not null foreign_key: true   |
### Association
- has_one  :orders
- belongs_to :user
- belongs_to :item_category
- belongs_to :item_condition
- belongs_to :shipping_charge
- belongs_to :region_of_origin
- belongs_to :days_to_ship


##　 
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| users_id           | references | not null foreign_key: true   |
| items_id           | references | not null foreign_key: true   |
### Association
- belongs_to:items
- belongs_to:users
- has_one: payment