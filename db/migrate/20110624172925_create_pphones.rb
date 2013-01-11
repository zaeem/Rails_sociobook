class CreatePphones < ActiveRecord::Migration
  def self.up
    create_table :pphones do |t|
      t.integer :profile_id
      t.string :phoneno
      t.string :type_
      t.string :countrycode

      t.timestamps
    end
    add_index :pphones, ["profile_id"], :name => "index_pphones_on_profile_id"            
  end

  def self.down
    remove_index :pphones, :name => :index_pphones_on_profile_id    
    drop_table :pphones
  end
end
