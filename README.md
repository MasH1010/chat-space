# データベース設計

## Usersテーブル(devise利用)

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, default: ""|
|password|string|null: false, default: ""|
※ passwordの詳細の記載は省略

### Association
 - has_many :groups, through: :group_users
 - has_many :group_users


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|

### Association
 - has_many :users, through: :group_users
 - has_many :group_users
 - accepts_nested_attributes_for :group_users
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
|image|text||
|group_id|integer|null: false, foreign_key: true|

### Association
 - belongs_to :group
