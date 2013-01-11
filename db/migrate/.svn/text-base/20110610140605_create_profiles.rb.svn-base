class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :yahoo_id
      t.string :yahoo_pass
      t.string :hotmail_id
      t.string :hotmail_pass
      t.string :gmail_id
      t.string :gmail_pass
      t.string :skype_id
      t.string :skype_pass
      t.string :contact_currentcity
      t.string :contact_email
      t.string :contact_screenname
      t.string :contact_messenger
      t.string :contact_phone
      t.string :contact_mobile
      t.string :contact_countrycode
      t.string :contact_zipcode
      t.string :contact_address
      t.string :contact_town
      t.string :contact_neighbour
      t.string :contact_website
      t.string :tv
      t.string :favour_quotes
      t.string :political_views
      t.string :political_views_desc
      t.integer :total_friends
      t.integer :featured_friends
      t.string :religion
      t.string :religion_name
      t.string :religion_logo
      t.string :religion_logo_path
      t.string :religion_desc
      t.boolean :show_birthdate
      t.boolean :show_gender
      t.string :gender
      t.string :relation_status
      t.string :interested_in
      t.string :languages
      t.string :aboutme
      t.date :birthdate

      t.timestamps
    end
    add_index :profiles, ["user_id"], :name => "index_profiles_on_user_id"
  end

  def self.down
    remove_index :profiles, :name => :index_profiles_on_user_id
    drop_table :profiles
  end
end
