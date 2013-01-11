class CreateCtags < ActiveRecord::Migration
  def self.up
    create_table :ctags do |t|
      t.integer :cphoto_id
      t.string :label
      t.integer :width
      t.integer :height
      t.integer :top
      t.integer :left

      t.timestamps
    end
    add_index :ctags, ["cphoto_id"], :name => "index_ctags_on_cphoto_id"
  end

  def self.down
    remove_index :ctags, :name => :index_ctags_on_cphoto_id
    drop_table :ctags
  end
end
