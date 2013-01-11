class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.integer :album_id
      t.integer :profile_id
      t.integer :poster_id
      t.integer :flag
      t.integer :cposted_sharedwithflag
      t.integer :group_id 
      t.string :name
      t.integer :flag
      t.string :album
      t.string :group
      t.string :type_
      t.string :desc
      t.string :misc

      t.timestamps
    end
    add_index :contents, ["profile_id"], :name => "index_contents_on_profile_id"    
    add_index :contents, ["poster_id"], :name => "index_contents_on_poster_id"        
  end

  def self.down
    remove_index :contents, :name => :index_contents_on_profile_id
    remove_index :contents, :name => :index_contents_on_poster_id
    drop_table :contents
  end
end
