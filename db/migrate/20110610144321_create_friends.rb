class CreateFriends < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.integer :profile_id
      t.string  :friend_id # Profile_ID of friend
      t.string  :status
      t.string  :desc
    end
    add_index :friends, ["profile_id"], :name => "index_friends_on_profile_id"
  end

  def self.down
    remove_index :friends, :name => :index_friends_on_profile_id
    drop_table :friends
  end
end