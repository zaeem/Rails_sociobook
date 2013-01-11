class CreateProfileActivities < ActiveRecord::Migration
  def self.up
    create_table :profile_activities do |t|
      t.integer :profile_id
      t.string :name
      t.string :title
      t.string :type_
      t.string :sport
      t.string :logo
      t.string :logo_path
      t.string :desc
      t.boolean :is_default

      t.timestamps
    end
    add_index :profile_activities, ["profile_id"], :name => "index_profile_activities_on_profile_id"    
  end

  def self.down
    remove_index :profile_activities, :name => :index_profile_activities_on_profile_id    
    drop_table :profile_activities
  end
end
