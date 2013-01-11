class CreateFriendProfileGroups < ActiveRecord::Migration
  def self.up
    create_table :friend_profile_groups do |t|
      t.integer :friend_id
      t.integer :profile_group_id
      t.string :desc
      
      t.timestamps
    end
  end

  def self.down
    drop_table :friend_profile_groups
  end
end
