class AddUserIdToChats < ActiveRecord::Migration[5.0]
  def change
    add_column :chats, :user_id, :integer
  end
end
