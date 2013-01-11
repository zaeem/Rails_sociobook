class CreateCpoptions < ActiveRecord::Migration
  def self.up
    create_table :cpoptions do |t|
      t.integer :cpoll_id
      t.integer :option
      t.string :optiontext
      t.string :misc

      t.timestamps
    end
    add_index :cpoptions, ["cpoll_id"], :name => "index_cpoptions_on_cpoll_id"    
  end

  def self.down
    remove_index :cpoptions, :name => :index_cpoptions_on_cpoll_id
    drop_table :cpoptions
  end
end
