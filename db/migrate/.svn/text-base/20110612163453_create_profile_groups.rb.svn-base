class CreateProfileGroups < ActiveRecord::Migration
  def self.up
    create_table :profile_groups do |t|
      t.integer :profile_id
      t.string :name
      t.string :logo
      t.string :logo_path
      t.string :desc
      t.boolean :is_default

      t.timestamps
    end
    add_index :profile_groups, ["profile_id"], :name => "index_profile_groups_on_profile_id"    
  end

  def self.down
    remove_index :profile_groups, :name => :index_profile_groups_on_profile_id
    drop_table :profile_groups
  end
end
