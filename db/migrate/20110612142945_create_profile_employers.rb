class CreateProfileEmployers < ActiveRecord::Migration
  def self.up
    create_table :profile_employers do |t|
      t.integer :profile_id
      t.string :title
      t.string :position
      t.string :city
      t.string :project
      t.date :fromdate
      t.date :todate
      t.string :website
      t.string :logo
      t.string :logo_path
      t.string :with
      t.boolean :iscurrent
      t.string :desc
      t.date :duration

      t.timestamps
    end
    add_index :profile_employers, ["profile_id"], :name => "index_profile_employers_on_profile_id"    
  end

  def self.down
    remove_index :profile_employers, :name => :index_profile_employers_on_profile_id
    drop_table :profile_employers
  end
end
