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
| name               | string | null: false |
| name_two           | string | null: false |
| name_kana          | string | null: false |
| name_two_kana      | string | null: false |
| birthday | date    | null: false |
### Association

- has_many :items
- has_many :buys


## items テーブル

|   Column    | Type       | Options     |
| ------      | ------     | ----------- |
| item_name   | string     | null: false |
| explanation | text       | null: false |
| category_id   | integer    | null: false |
| condition_id  | integer    | null: false |
| charge_id     | integer    | null: false |
| area_id       | integer    | null: false |
| day_id        | integer    | null: false |
| price         | integer    | null: false |
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
- has_one    :address



## addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code   | string | null: false                    |
| area_id       |integer | null: false                    |
| city          | string | null: false                    |
| house_number  | string | null: false                    |
| building_name | string |                                |
| phone         | string | null: false                    |
| buy           |references | foreign_key: true           |

### Association

- belongs_to :buy