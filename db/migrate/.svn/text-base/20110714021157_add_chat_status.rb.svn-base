class AddChatStatus < ActiveRecord::Migration
  def self.up
    add_column :users, :status, :integer, :default => 0
    #0 online
    #1 offline
    #2 away
    #3 busy
  end

  def self.down
    remove_column :users, :status
  end
end
