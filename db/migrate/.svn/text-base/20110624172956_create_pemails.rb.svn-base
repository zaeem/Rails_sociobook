class CreatePemails < ActiveRecord::Migration
  def self.up
    create_table :pemails do |t|
      t.integer :profile_id
      t.string :email
      t.string :type_

      t.timestamps
    end
    add_index :pemails, ["profile_id"], :name => "index_pemails_on_profile_id"            
  end

  def self.down
    remove_index :pemails, :name => :index_pemails_on_profile_id    
    drop_table :pemails
  end
end
