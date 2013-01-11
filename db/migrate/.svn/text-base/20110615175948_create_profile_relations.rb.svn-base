class CreateProfileRelations < ActiveRecord::Migration
  def self.up
    create_table :profile_relations do |t|
      t.integer :profile_id
      t.string :is_family
      t.string :family_name
      t.string :family_relation

      t.timestamps
    end
    add_index :profile_relations, ["profile_id"], :name => "index_profile_relations_on_profile_id"    
  end

  def self.down
    remove_index :profile_relations, :name => :index_profile_relations_on_profile_id
    drop_table :profile_relations
  end
end
