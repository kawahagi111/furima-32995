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

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nicname  | string | null: false |
| email    | string | null: false　unique: turu |
| encrypred_password | string | null: false |
| name     | string | null: false |
| name_two | string | null: false |
| birthday | string | null: false |
### Association

- has_many :items
- has_many :buys
- has_one  :addresse


## items テーブル

|   Column    | Type       | Options     |
| ------      | ------     | ----------- |
| item_name   | string     | null: false |
| explanation | text       | null: false |
| category_id   | string     | null: false |
| condition_id  | string     | null: false |
| charge_id     | string     | null: false |
| area_id       | string     | null: false |
| day_id        | string     | null: false |
| price_id      | numeric    | null: false |
| user          | references | foreign_key: true |



### Association

- belongs_to :user
- has_one :buy


## buys テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one    :addresse



## addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code   | string | null: false                    |
| area_id       |integer | null: false                    |
| city          | string | null: false                    |
| house_number  | string | null: false                    |
| building_name | string |                                |
| phone         | string | null: false                   |

### Association

- belongs_to :user
- belongs_to :buy