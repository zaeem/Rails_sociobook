class CreateProfileUniversities < ActiveRecord::Migration
  def self.up
    create_table :profile_universities do |t|
      t.integer :profile_id
      t.string :title
      t.string :concentration
      t.date :todate
      t.date :fromdate
      t.string :classname
      t.string :website
      t.string :attendedfor
      t.string :logo
      t.string :logo_path
      t.string :with
      t.boolean :iscurrent
      t.string :desc
      t.date :duration

      t.timestamps
    end
    add_index :profile_universities, ["profile_id"], :name => "index_profile_universities_on_profile_id"    
  end

  def self.down
    remove_index :profile_universities, :name => :index_profile_universities_on_profile_id
    drop_table :profile_universities
  end
end
