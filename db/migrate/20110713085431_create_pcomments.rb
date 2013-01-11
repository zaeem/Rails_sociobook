class CreatePcomments < ActiveRecord::Migration
  def self.up
    create_table :pcomments do |t|
      t.integer :cphoto_id
      t.string :type_
      t.integer :flag
      t.integer :profile_id
      t.integer :is_spam
      t.integer :is_abuse
      t.integer :noof_dislike
      t.integer :noof_like

      t.timestamps
    end
  end

  def self.down
    drop_table :pcomments
  end
end
