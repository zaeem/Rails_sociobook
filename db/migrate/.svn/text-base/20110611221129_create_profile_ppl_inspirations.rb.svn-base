class CreateProfilePplInspirations < ActiveRecord::Migration
  def self.up
    create_table :profile_ppl_inspirations do |t|
      t.integer :profile_id
      t.string :name
      t.string :title
      t.string :reason
      t.string :logo
      t.string :logo_path
      t.string :desc
      t.boolean :is_default

      t.timestamps
    end
    add_index :profile_ppl_inspirations, ["profile_id"], :name => "index_profile_ppl_inspirations_on_profile_id"
  end

  def self.down
    remove_index :profile_ppl_inspirations, :name => :index_profile_ppl_inspirations_on_profile_id
    drop_table :profile_ppl_inspirations
  end
end
