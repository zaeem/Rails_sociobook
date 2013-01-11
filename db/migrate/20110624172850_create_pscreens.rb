class CreatePscreens < ActiveRecord::Migration
  def self.up
    create_table :pscreens do |t|
      t.integer :profile_id
      t.string :name
      t.string :type_

      t.timestamps
    end
    add_index :pscreens, ["profile_id"], :name => "index_pscreens_on_profile_id"        
  end

  def self.down
    remove_index :pscreens, :name => :index_pscreens_on_profile_id
    drop_table :pscreens
  end
end
