class CreateCpshares < ActiveRecord::Migration
  def self.up
    create_table :cpshares do |t|
      t.integer :cpoll_id
      t.integer :profile_id
      t.integer :option
      t.boolean :isanswered
      t.string :misc

      t.timestamps
    end
    add_index :cpshares, ["cpoll_id"], :name => "index_cpshares_on_cpoll_id"        
  end

  def self.down
    remove_index :cpshares, :name => :index_cpshares_on_cpoll_id   
    drop_table :cpshares
  end
end
