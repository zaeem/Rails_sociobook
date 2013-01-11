class ProfileActivity < ActiveRecord::Base
  belongs_to :profile

  validates_length_of :name, :within => 3..20
  validates_format_of :name, :sport, :with => /^[a-zA-Z]*$/   
end
