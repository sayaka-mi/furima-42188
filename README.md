## users

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | integer | null: false               |

### Association

- has_many :items
- has_many :purchases

## items

| Column              | Type      | Options                        |
| ------------------- | --------- | ------------------------------ |
| image               | string    | null: false                    |
| name                | string    | null: false                    |
| description         | text      | null: false                    |
| category            | integer   | null: false, ActiveHash使用    |
| condition           | integer   | null: false, ActiveHash使用    |
| shopping_fee_burden | integer   | null: false, ActiveHash使用    |
| shopping_id         | integer   | null: false, ActiveHash使用    |
| delivery_time       | integer   | null: false, ActiveHash使用    |
| price               | integer   | null: false                    |
| status              | integer   | null: false, ActiveHash使用    |
| user                | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| item   | reference | null: false, foreign_key: true |
| user   | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| post_code     | string    | null: false                    |
| prefecture_id | integer   | null: false, ActiveHash使用    |
| city          | string    | null: false                    |
| block         | string    | null: false                    |
| building_name | string    |                                |
| phone_number  | string    | null: false                    |
| purchase      | reference | null: false, foreign_key: true |

### Association

- belongs_to :purchase