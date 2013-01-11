class CreateClinks < ActiveRecord::Migration
  def self.up
    create_table :clinks do |t|
      t.integer :content_id
      t.string :link
      t.string :title
      t.string :desc
      t.string :misc

      t.timestamps
    end
    add_index :clinks, ["content_id"], :name => "index_clinks_on_content_id"    
  end

  def self.down
    remove_index :clinks, :name => :index_clinks_on_content_id    
    drop_table :clinks
  end
end
