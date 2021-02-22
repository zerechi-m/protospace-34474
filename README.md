# README
	
# テーブル設計

## users テーブル

| Column     | Type     | Options     |
|------------|----------|-------------|
| name       | string   | not null    |
| email      | string   | not null    |
| password   | string   | not null    |
| profile    | text     | not null    |
| occupation | text     | not null    |
| position   | text     | not null    |

### Association

- has_many :prototypes
- has_many :comments

## prototypes テーブル

| Column     | Type      | Options          |
|------------|-----------|------------------|
| title      | string    | not null         |
| catch_copy | text      | not null         |
| concept    | text      | not null         |
| image      | activestorageで実装           |
| user       | references| foreign_key:true |


### Association

- has_many :comments
- belongs_to :user


### comments テーブル

| Column     | Type      | Options     |
|------------|-----------|-------------|
| text       | text      | not null    |
| prototype  | references|             |
| user       | references|             |

### Association

- belongs_to :comment
- belongs_to :user