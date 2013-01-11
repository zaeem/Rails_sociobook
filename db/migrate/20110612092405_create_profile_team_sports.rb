class CreateProfileTeamSports < ActiveRecord::Migration
  def self.up
    create_table :profile_team_sports do |t|
      t.integer :profile_id
      t.string :title
      t.string :game
      t.string :logo
      t.string :logo_path
      t.string :desc
      t.boolean :is_default

      t.timestamps
    end
    add_index :profile_team_sports, ["profile_id"], :name => "index_profile_team_sports_on_profile_id"
  end

  def self.down
    remove_index :profile_team_sports, :name => :index_profile_team_sports_on_profile_id
    drop_table :profile_team_sports
  end
end
