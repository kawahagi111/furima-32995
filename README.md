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
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| nicname  | string | null: false |
### Association

- has_many :items
- has_many :buys
- has_one :addresses


## items テーブル

|   Column    | Type       | Options     |
| ------      | ------     | ----------- |
| item_name   | string     | null: false |
| explanation | text       | null: false |
| category    | string     | null: false |
| condition   | string     | null: false |
| charge      | string     | null: false |
| area        | string     | null: false |
| day         | string     | null: false |
| user        | references | null: false, foreign_key: true |



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
- has_one :buy



## addresses テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| postal_code   | string | null: false                    |
| prefecture    | string | null: false                    |
| city          | string | null: false                    |
| house_number  | string | null: false                    |
| building_name | string |                                |
| phone         | numeric | null: false                   |

### Association

- belongs_to :user
- belongs_to :buy