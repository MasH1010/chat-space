# データベース設計

## Usersモデル(devise利用)
~~~ruby
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :groups, through: :group_users
  has_many :group_users
end
~~~

## Usersテーブル(devise利用)
~~~ruby
class DeviseCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name,               null: false, unique: true
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
~~~

## groupsモデル
~~~ruby
class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_many :group_users
  accepts_nested_attributes_for :group_users
  has_many :chats
end
~~~
## groupsテーブル
~~~ruby
class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name, null:false, unique: true
      t.timestamps
    end
  end
end
~~~

## group_usersモデル
~~~ruby
class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
~~~
## groups_usersテーブル
~~~ruby
class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.references  :user,  index: true, foreign_key: true
      t.references  :group, index: true, foreign_key: true
      t.timestamps
    end
  end
end
~~~

## chatsモデル
~~~ruby
class Chat < ApplicationRecord
  belongs_to :group
end
~~~
## chatsテーブル
~~~ruby
class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.text :text
      t.text :image
      t.timestamps
    end
  end
end

class AddGroupIdToChats < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :group_id, :integer
  end
end
~~~
