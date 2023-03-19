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
- has_many :likes
- belongs_to :birth_year
- belongs_to :birth_month
- belongs_to :birth_day
- has_one :address
- has_one :credit_card

## birth_year  ActiveHash::Base
| Column   | Type        | Options                      |
| ------   | ------      | ---------------------------- |
| year     | integer      | not null                    |
### Association
- has_many:users

## birth_month   ActiveHash::Base
| Column   | Type        | Options                      |
| ------   | ------      | ---------------------------- |
| month    | integer      | not null                    |
### Association
- has_many:users

## birth_day   ActiveHash::Base
| Column   | Type        | Options                      |
| ------   | ------      | ---------------------------- |
| day      | integer      | not null                    |
### Association
- has_many:users

## address  テーブル
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| post_code          | integer    | not null                     |
| prefectures_id     | integer    | not null                     |
| city               | string     | not null                     |
| building_name      | string     | not null                     |
| users_id            | references | not null foreign_key:true    |
### Association
- belongs_to :user
- belongs_to :prefectures

## prefectures  ActiveHash::Base
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| prefectures_na     | integer    | not null                     |
### Association
- has_many:address

## credit_card  テーブル
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| customer_id        | integer    | not null                     |
| date_of_expiry     | integer    | not null                     |
| cord_id            | integer    | not null                     |
| user_id            | references | not null foreign_key:true    |
### Association
belongs_to :user


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
- has_many :comments
- has_many :likes
- belongs_to :user
- belongs_to :item_category
- belongs_to :item_condition
- belongs_to :shipping_charge
- belongs_to :region_of_origin
- belongs_to :days_to_ship

## item_category  ActiveHash::Base
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| category           | integer    | not null                     |
### Association
- has_many:items

## item_condition  ActiveHash::Base
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| condition          | integer    | not null                     |
### Association
- has_many:items

## shipping_charge  ActiveHash::Base
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| charge             | integer    | not null                     |
### Association
- has_many:items

## region_of origin  ActiveHash::Base
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| origin             | integer    | not null                     |
### Association
- has_many:items

## days_to_ship  ActiveHash::Base
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| days               | integer    | not null                     |
### Association
- has_many:items

## comments
| Column             | Type       | Options                      |
| ------------------ | -----------| ---------------------------- |
| users_id           | references | not null foreign_key: true   |
| items_id           | references | not null foreign_key: true   |
| comment            | text       | not null                     |
### Association
- has_many:items
