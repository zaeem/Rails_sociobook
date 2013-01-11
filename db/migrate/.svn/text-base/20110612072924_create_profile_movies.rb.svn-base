class CreateProfileMovies < ActiveRecord::Migration
  def self.up
    create_table :profile_movies do |t|
      t.integer :profile_id
      t.string :title
      t.string :novel
      t.string :artist
      t.string :logo
      t.string :logo_path
      t.string :desc
      t.boolean :is_default

      t.timestamps
    end
    add_index :profile_movies, ["profile_id"], :name => "index_profile_movies_on_profile_id"
  end

  def self.down
    remove_index :profile_movies, :name => :index_profile_movies_on_profile_id
    drop_table :profile_movies
  end
end
