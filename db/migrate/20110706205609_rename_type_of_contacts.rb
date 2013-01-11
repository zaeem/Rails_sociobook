class RenameTypeOfContacts < ActiveRecord::Migration
  def self.up
    rename_column:contacts,:type,:email_type
  end

  def self.down
    rename_column:contacts,:email_type,:type
  end
end
