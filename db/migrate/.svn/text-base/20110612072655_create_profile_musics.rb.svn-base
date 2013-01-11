class CreateProfileMusics < ActiveRecord::Migration
  def self.up
    create_table :profile_musics do |t|
      t.integer :profile_id
      t.string :title
      t.string :album
      t.string :artist
      t.string :logo
      t.string :logo_path
      t.string :desc
      t.boolean :is_default

      t.timestamps
    end
    add_index :profile_musics, ["profile_id"], :name => "index_profile_musics_on_profile_id"
  end

  def self.down
    remove_index :profile_musics, :name => :index_profile_musics_on_profile_id
    drop_table :profile_musics
  end
end
