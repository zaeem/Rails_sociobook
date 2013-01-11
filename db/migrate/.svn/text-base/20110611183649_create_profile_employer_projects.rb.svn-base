class CreateProfileEmployerProjects < ActiveRecord::Migration
  def self.up
    create_table :profile_employer_projects do |t|
      t.integer :profile_employer_id
      t.string :project
      t.string :with
      t.date :duration
      t.string :desc

      t.timestamps
    end
  end

  def self.down
    drop_table :profile_employer_projects
  end
end
