class CreatePwebsites < ActiveRecord::Migration
  def self.up
    create_table :pwebsites do |t|
      t.integer :profile_id
      t.string :website
      t.string :url

      t.timestamps
    end
    add_index :pwebsites, ["profile_id"], :name => "index_pwebsites_on_profile_id"            
  end

  def self.down
    remove_index :pwebsites, :name => :index_pwebsites_on_profile_id        
    drop_table :pwebsites
  end
end
