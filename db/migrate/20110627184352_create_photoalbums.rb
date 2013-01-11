class CreatePhotoalbums < ActiveRecord::Migration
  def self.up
    create_table :photoalbums do |t|
      t.integer :profile_id
      t.integer :flag
      t.string :name
      t.string :logo
      t.string :logo_path
      t.string :desc
      t.boolean :is_default

      t.timestamps
    end
    add_index :photoalbums, ["profile_id"], :name => "index_photoalbums_on_profile_id"                
  end

  def self.down
    remove_index :photoalbums, :name => :index_photoalbums_on_profile_id        
    drop_table :photoalbums
  end
end
