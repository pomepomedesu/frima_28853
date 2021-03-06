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
| birth_day       | data    | null: false |


### Association

- has_many :items
- has_many :buyers

## itemsテーブル

| Column             | Type       | Option                          |
| ------------------ | ---------- | ------------------------------- |
| image              | string     | null: false                     |
| writings           | text       | null: false                     |
| name               | string     | null: false                     |
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
| ------------- | ---------- | -------------------------------------------- |
| buyer         | references |              null: false,  foreign_key: true |
| postal_code   | string     | default: "", null: false,                    |
| prefecture    | integer    |              null: false                     |
| city          | string     | default: "" , null: false                    |
| house_number  | string     | default: "" , null: false                    |
| building_name | string     |                                              |
| phone_number  | string     | default: "",  null: false                    |

### Association

- belongs_to :buyer
