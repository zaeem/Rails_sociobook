class CreateCvideos < ActiveRecord::Migration
  def self.up
    create_table :cvideos do |t|
      t.integer :content_id
      t.string :title
      t.string :inthisvideo
      t.string :video_file_name
      t.string :video_content_type
      t.string :video_file_path
      t.integer :video_file_size
      t.string :video_tfile_name
      t.string :video_tcontent_type
      t.string :video_tfile_path
      t.integer :video_tfile_size
      t.string :desc
      t.string :misc

      t.timestamps
    end
    add_index :cvideos, ["content_id"], :name => "index_cvideos_on_content_id" 
  end

  def self.down
    remove_index :cvideos, :name => :index_cvideos_on_content_id    
    drop_table :cvideos
  end
end
