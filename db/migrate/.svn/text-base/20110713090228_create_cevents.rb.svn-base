class CreateCevents < ActiveRecord::Migration
  def self.up
    create_table :cevents do |t|
      t.integer :content_id
      t.string :title
      t.string :link
      t.date :fromdate
      t.date :todate
      t.string :plan
      t.string :where
      t.string :street
      t.string :citytown
      t.string :moreinfo
      t.integer :flag_invitemembersofhosts
      t.integer :flag_view
      t.integer :flag_showgroup
      t.string :ephoto_file_name
      t.string :ephoto_content_type
      t.integer :ephoto_file_size
      t.datetime :ephoto_updated_at
      t.string :desc
      t.string :misc

      t.timestamps
    end
  end

  def self.down
    drop_table :cevents
  end
end
