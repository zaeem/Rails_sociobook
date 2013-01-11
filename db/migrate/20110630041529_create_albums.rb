class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.integer :profile_id
      t.integer :flag
      t.string :name
      t.string :logo
      t.string :logo_path
      t.string :desc
      t.boolean :is_default

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
