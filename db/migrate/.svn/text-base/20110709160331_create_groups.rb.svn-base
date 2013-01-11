class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :profile_id
      t.string :name
      t.integer :flag_privacy
      t.integer :flag_notifications
      t.integer :flag_chat
      t.integer :flag_showgroup
      t.integer :flag_email
      t.integer :flag_sms
      t.string :gphoto_file_name
      t.string :gphoto_content_type
      t.integer :gphoto_file_size
      t.datetime :gphoto_updated_at
      t.string :desc
      t.boolean :is_default
      t.string :misc

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
