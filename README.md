# アプリケーション名
　My Ejition

## 辞書作成アプリ
　自分好みの辞書を作成できる。
　他ユーザーからのいいね機能があり、いいねが一定数を超えるとアプリ内で「出版」して他ユーザーも検索機能を使えるようになる。

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |

### Association

- has_many :dictionaries
- has_many :comments
- has_many :likes

## dictionaries テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| name                 | string     | null: false |
| info                 | text       | null: false |
| category_id          | integer    | null: false |
| content_id           | references | null: false, foreign_key: true |
| user_id              | references | null: false, foreign_key: true |

### Association 

- belongs_to :user
- has_many :comments
- has_many :contents
- has_many :likes

## contents テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| phrase               | string     | null: false |
| content_mean         | text       | null: false |
| phrase_refer         | text       |
| dictionary_id        | references | null: false, foreign_key: true |

### Association 

- belongs_to :dictionary

## comments テーブル

| Column               | Type       | Options     |
| -------------------- | ---------- | ----------- |
| comment_text         | text       | null: false |
| dictionary_id        | references | null: false, foreign_key: true |
| user_id              | references | null: false, foreign_key: true |

### Association 

- belongs_to :dictionary
- belongs_to :user

## likes テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| dictionary_id | references | null: false, foreign_key: true |
| user_id       | references | null: false, foreign_key: true |

### Association 

- belongs_to :dictionary
- belongs_to :user