class CreateCcomments < ActiveRecord::Migration
  def self.up
    create_table :ccomments do |t|
      t.integer :content_id
      t.string :type_
      t.integer :flag
      t.integer :is_spam
      t.integer :is_abuse
      t.integer  :noof_dislike
      t.integer :noof_like
      t.integer :postedagainst
      t.integer :noof_like
      t.integer :profile_id
      t.string :text_
      t.string :desc
      t.string :misc

      t.timestamps
    end
    add_index :ccomments, ["content_id"], :name => "index_ccomments_on_content_id"    
  end

  def self.down
    remove_index :ccomments, :name => :index_ccomments_on_content_id    
    drop_table :ccomments
  end
end
