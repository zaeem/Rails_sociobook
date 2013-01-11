class CreateProfileInterests < ActiveRecord::Migration
  def self.up
    create_table :profile_interests do |t|
      t.integer :profile_id
      t.string :name
      t.string :title
      t.string :type_
      t.string :logo
      t.string :logo_path
      t.string :desc
      t.boolean :is_default

      t.timestamps
    end
    add_index :profile_interests, ["profile_id"], :name => "index_profile_interests_on_profile_id"
  end

  def self.down
    remove_index :profile_interests, :name => :index_profile_interests_on_profile_id
    drop_table :profile_interests
  end
end
