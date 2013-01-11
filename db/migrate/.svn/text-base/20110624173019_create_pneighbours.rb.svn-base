class CreatePneighbours < ActiveRecord::Migration
  def self.up
    create_table :pneighbours do |t|
      t.integer :profile_id
      t.string :title
      t.string :type_
      t.string :desc

      t.timestamps
    end
    add_index :pneighbours, ["profile_id"], :name => "index_pneighbours_on_profile_id"        
  end

  def self.down
    remove_index :pneighbours, :name => :index_pneighbours_on_profile_id    
    drop_table :pneighbours
  end
end
