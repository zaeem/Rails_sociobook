class ProfileBook < ActiveRecord::Base
  belongs_to :profile

  validates_length_of :title, :within => 3..20
  validates_format_of :title, :auther, :with => /^[a-zA-Z]*$/
 
end
