class CreateCphotos < ActiveRecord::Migration
  def self.up
    create_table :cphotos do |t|
      t.integer :content_id
      t.string :title
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      t.string :desc
      t.string :misc

      t.timestamps
    end
    add_index :cphotos, ["content_id"], :name => "index_cphotos_on_content_id"
  end

  def self.down
    remove_index :cphotos, :name => :index_cphotos_on_content_id
    drop_table :cphotos
  end
end
