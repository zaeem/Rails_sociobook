class CreateCstatuses < ActiveRecord::Migration
  def self.up
    create_table :cstatuses do |t|
      t.integer :content_id
      t.string :title
      t.string :text_
      t.string :desc
      t.string :misc

      t.timestamps
    end
    add_index :cstatuses, ["content_id"], :name => "index_cstatuses_on_content_id"   
  end

  def self.down
    remove_index :cstatuses, :name => :index_cstatuses_on_content_id    
    drop_table :cstatuses
  end
end
