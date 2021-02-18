# アプリケーション名
My Ejition

## 辞書作成アプリ
自分好みの辞書を作成できる。
いいね機能があり、マイページにていいねをした他ユーザーが作成した辞書の一覧を見ることができる。

## UEL
https://myejition-2.herokuapp.com/

## ID/パスワード
ID: harumin
Pass: 7777

## テスト用アカウント等
ログイン用
メールアドレス: testmyejition111@gmail.com
パスワード: testmyejition111

## Githubリポジトリ
https://github.com/githaruka/myejition-2.git

## 実装内容
# 新規辞書作成機能
トップ画面の一番下にある「create new」ボタンを押すと、新規作成画面へ遷移します。タイトル・内容の説明・カテゴリーを入力して新規作成ボタンを押すと、作成した辞書の詳細ページへ遷移します。遷移後の詳細ページの下にある語句の追加ボタンを押すと語句を追加することが出来ます。

# いいね機能
ログインしているユーザーが他ユーザーが作成した辞書の詳細ページへ遷移すると、ページの一番下にいいねボタンが表示されます。そのボタンを押すと、いいねを押した人数がカウントされます。一人のユーザーは一つの辞書につき一度しかいいねはできず、取り消しが可能です。

# 語句の詳細ページ
辞書の詳細ページに表示された語句の文字部分を押すと、それぞれの語句の詳細ページへ遷移します。詳細ページでは、語句作成時に入力した参照したサイトURl等の詳細情報の閲覧、下に表示されているボタンを押すと語句の編集を行うことが出来ます。

## 実装予定の機能
# 検索機能
辞書や辞書内の語句の検索ができる機能を実装予定です。基本的には辞書内の語句の検索機能を使えるのは辞書を作成したユーザー本人のみです。

# 出版機能
他ユーザーからのいいねの数が一定数を超えると、アプリ内で出版することができ、出版された辞書は他ユーザーも辞書内の語句の検索機能を使用できるようになります。

## 開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code



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