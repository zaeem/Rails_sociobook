class CreateCpolls < ActiveRecord::Migration
  def self.up
    create_table :cpolls do |t|
      t.integer :content_id
      t.string :question
      t.boolean :allow_options
      t.string :desc
      t.string :misc

      t.timestamps
    end
    add_index :cpolls, ["content_id"], :name => "index_cpolls_on_content_id"
  end

  def self.down
    remove_index :cpolls, :name => :index_cpolls_on_content_id
    drop_table :cpolls
  end
end
