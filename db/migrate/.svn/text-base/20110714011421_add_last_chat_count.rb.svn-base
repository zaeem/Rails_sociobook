class AddLastChatCount < ActiveRecord::Migration
  def self.up
    add_column :users, :last_chat_count, :integer, :default => 0
  end

  def self.down
    remove_column :users, :last_chat_count
  end
end
