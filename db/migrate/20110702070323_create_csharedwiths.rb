class CreateCsharedwiths < ActiveRecord::Migration
  def self.up
    create_table :csharedwiths do |t|
      t.integer :content_id
      t.integer :group_id
      t.integer :profile_id
      t.string :type_
      t.integer :flag
      t.string :desc
      t.string :misc

      t.timestamps
    end
   add_index :csharedwiths, ["content_id"], :name => "index_csharedwiths_on_content_id"    
  end

  def self.down
    remove_index :csharedwiths, :name => :index_csharedwiths_on_content_id    
    drop_table :csharedwiths
  end
end
