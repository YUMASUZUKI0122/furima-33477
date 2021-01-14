usersテーブル

| Column             | Type   | Options
| ---------          | ------ | --------
| nickname           | string | null: false
| email              | string | null: false, unique: true
| encrypted_password | string | null: false
| first_name         | string | null: false
| last_name          | string | null: false
| first_kananame     | string | null: false
| last_kananame      | string | null: false
| birthday           | date   | null: false

### Association

- has_many :items
- has_many :purchases


itemsテーブル

| Column      | Type       | Options
| ----------- | ---------- | --------
| name        | string     | null: false
| explanation | text       | null: false
| category_id | integer    | null: false
| state_id    | integer    | null: false
| burden_id   | integer    | null: false
| area_id     | integer    | null: false
| days_id     | integer    | null: false
| price       | integer    | null: false
| user_id     | integer    | null: false

### Association

- belongs_to :user

purchasesテーブル

| Column             | Type       | Options
| ------------------ | ---------- | --------
| user_id            | integer    | foreign_key: true
| category_id        | integer    | foreign_key: true
| state_id           | integer    | foreign_key: true
| burden_id          | integer    | foreign_key: true
| area_id            | integer    | foreign_key: true
| days_id            | integer    | foreign_key: true


### Association

- has_one :delivery


deliveriesテーブル

| Column        | Type         | Options
| ------------- | ------------ | --------
| postal_code   | string       | null: false
| area_id       | integer      | null: false
| city          | string       | null: false
| address       | string       | null: false
| building_name | string       | 
| phone_number  | string       | null: false
| user_id       | integer      | foreign_key: true

### Association

- belongs_to :purchases

