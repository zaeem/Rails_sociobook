class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :profile_id
      t.string  :email_id
      t.string  :type
      t.string  :desc
      
      t.timestamps
    end
    add_index :contacts, ["profile_id"], :name => "index_contacts_on_profile_id"
  end

  def self.down
    remove_index :contacts, :name => :index_contacts_on_profile_id
    drop_table :contacts
  end
end