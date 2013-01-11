class CreateCadds < ActiveRecord::Migration
  def self.up
    create_table :cadds do |t|
      t.integer :content_id
      t.string :title
      t.string :link
      t.string :body
      t.string :ephoto_file_name
      t.string :ephoto_content_type
      t.integer :ephoto_file_size
      t.datetime :ephoto_updated_at
      t.string :desc
      t.string :misc

      t.timestamps
    end
  end

  def self.down
    drop_table :cadds
  end
end
