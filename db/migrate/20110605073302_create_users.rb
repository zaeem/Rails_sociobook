class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string    :first_name
      t.string    :last_name
      t.string    :email
      t.string    :login
      t.string    :crypted_password
      t.string    :password_salt
      t.string    :persistence_token
      t.string    :gender
      t.date      :birth_date
      t.integer   :login_count,         :null => false, :default => 0
      t.integer   :failed_login_count,  :null => false, :default => 0
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip
      t.timestamps
    end

    add_index :users, ["email"], :name => "index_users_on_email", :unique => true, :default => "", :null => false
    add_index :users, ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

  end

  def self.down
    remove_index :users, :name => :index_users_on_email
    remove_index :users, :name => :index_users_on_persistence_token
    drop_table :users
  end
end
