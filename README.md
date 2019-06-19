# データベース設計

* Usersテーブル(devise利用)
```
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :groups, through: :group_users
  has_many :group_users
end
```

* groupsテーブル
```
class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_many :group_users
  accepts_nested_attributes_for :group_users
  has_many :chats
end
```

* group_usersテーブル
```
class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group
end
```

* chatsテーブル
```
class Chat < ApplicationRecord
  belongs_to :group
end
```

