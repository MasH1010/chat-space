class CreateChats < ActiveRecord::Migration[5.0]
  def change
    create_table :chats do |t|
      t.text :text
      t.text :image
      t.timestamps
    end
  end
end
