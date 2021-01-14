usersテーブル

| Column             | Type   | Options
| ---------          | ------ | --------
| nickname           | string | null: false
| email              | string | null: false
| encrypted_password | string | null: false
| first_name         | string | null: false
| last_name          | string | null: false
| first_kananame     | string | null: false
| last_kananame      | string | null: false
| birthday           | date   | null: false

### Association

- has_many :items


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

### Association

- belongs_to :users

purchasesテーブル

| Column             | Type       | Options
| ------------------ | ---------- | --------
| nickname           | string     | null: false
| email              | string     | null: false
| encrypted_password | string     | null: false
| first_name         | string     | null: false
| last_name          | string     | null: false
| first_kananame     | string     | null: false
| last_kananame      | string     | null: false
| birthday           | date       | null: false 
| name               | string     | null: false
| explanation        | text       | null: false
| category_id        | integer    | null: false
| state_id           | integer    | null: false
| burden_id          | integer    | null: false
| area_id            | integer    | null: false
| days_id            | integer    | null: false
| price              | integer    | null: false

### Association

- has_one :deliverys


deliverysテーブル

| Column        | Type         | Options
| ------------- | ------------ | --------
| postal_code   | string       | null: false
| area_id       | integer      | null: false
| city          | string       | null: false
| address       | string       | null: false
| building_name | string       | 
| phone_number  | string       | null: false

### Association

- has_one :purchases

