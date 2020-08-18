# テーブル設計

## users テーブル

| Column          | Type    |  Option     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_day       | integer | null: false |

### Association

- has_many :items
- has_one  :buyer

## itemsテーブル

| Column             | Type       | Option                          |
| ------------------ | ---------- | ------------------------------- |
| image              | string     | null: false                     |
| writings           | text       | null: false                     |
| item_name          | string     | null: false                     |
| price              | integer    | null: false                     |
| user               | references | null: false, foreign_key: true  |
| category_id        | integer    | null: false, foreign_key: true  |
| condition_id       | integer    | null: false, foreign_key: true  |
| sipping_charges_id | integer    | null: false, foreign_key: true  |
| prefecture_id      | integer    | null: false, foreign_key: true  |
| delivery_days_id   | integer    | null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_one    :buyer
- has_many   :category
- has_many   :condition
- has_many   :sipping_charges
- has_many   :prefecture
- has_many   :delivery_days

## buyersテーブル

| Column    | Type       | Option                          |
| --------- | ---------- | ------------------------------- |
| user      | references | null: false, foreign_key: true  |
| item      | references | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addressesテーブル
 
| Column        | Type       | Option                                       |
| ------------- | --------------------------------------------------------- |
| buyer         | references |              null: false,  foreign_key: true |
| postal_code   | string     | default: "", null: false,                    |
| prefecture    | integer    |              null: false                     |
| city          | string     | default: "" , null: false                    |
| house_number  | integer    | default: "" , null: false                    |
| building_name | string     |                                              |
| phone_number  | integer    | default: "",  null: false                    |
 
### Association

- belongs_to :buyer
- belongs_to :prefecture

## category(active_hash)テーブル

| Column        | Type       | Option      |
| ------------- | ------------------------ |
| category      | string     | null: false |

### Association

- belongs_to :item

## condition(active_hash)テーブル

| Column        | Type       | Option      |
| ------------- | ------------------------ |
| condition     | string     | null: false |

### Association

- belongs_to :item

## shipping_charges(active_hash)テーブル

| Column           | Type       | Option      |
| ---------------- | ------------------------ |
| shipping_charges | string     | null: false |

### Association

- belongs_to :item

## delivery_days(active_hash)テーブル

| Column           | Type       | Option      |
| ---------------- | ------------------------ |
| delivery_days    | string     | null: false |

### Association

- belongs_to :item
