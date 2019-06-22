# データベース設計

## Usersテーブル(devise利用)

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, unique: true|
|email|string|null: false, default: ""|
|password|string|null: false, default: ""|

※ deviseで作成される他のカラム「encrypted_password」「reset_password_token」「reset_password_sent_at」
「remember_created_at」の記載は省略

### Association
 - has_many :groups, through: :group_users
 - has_many :group_users
 - has_many :chats


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
 - has_many :users, through: :group_users
 - has_many :group_users
 - has_many :chats


## group_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, index: true, foreign_key: true|
|group_id|integer|null: false, index: true, foreign_key: true|

### Association
 - belongs_to :user
 - belongs_to :group


## chatsテーブル

|Column|Type|Options|
|------|----|-------|
|text|text||
|image|string||
|group_id|integer|null: false, foreign_key: true|

### Association
 - belongs_to :group
 - belongs_to :user
