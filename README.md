usersテーブル

| Column    | Type   | Options
| --------- | ------ | --------
| nickname  | string | null: false
| email     | string | null: false
| password  | string | null: false
| name      | string | null: false
| kana_name | string | null: false
| birthday  | string | null: false

itemsテーブル

| Column           | Type       | Options
| ---------------- | ---------- | --------
| item.name        | string     | null: false
| item.explanation | text       | null: false
| item_details     | text       | null: false
| delivery         | string     | null: false
| price            | string     | null: false

purchasesテーブル

| Column      | Type         | Options
| ----------- | ------ ----- | --------
| credit      | string       | null: false


deliverysテーブル

| Column        | Type         | Options
| ------------- | ------------ | --------
| postal.code   | string       | null: false
| todofuken     | string       | null: false
| city          | string       | null: false
| address       | string       | null: false
| building.name | string       | null: false
| phone.number  | string       | null: false

