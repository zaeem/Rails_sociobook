class CreateProfileBooks < ActiveRecord::Migration
  def self.up
    create_table :profile_books do |t|
      t.integer :profile_id
      t.string :title
      t.string :auther
      t.string :logo
      t.string :logo_path
      t.string :desc
      t.boolean :is_default

      t.timestamps
    end
    add_index :profile_books, ["profile_id"], :name => "index_profile_books_on_profile_id"
  end

  def self.down
    remove_index :profile_books, :name => :index_profile_books_on_profile_id
    drop_table :profile_books
  end
end
