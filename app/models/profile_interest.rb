class ProfileInterest < ActiveRecord::Base
  belongs_to :profile

  validates_length_of :name, :within => 3..20
  validates_format_of :name, :with => /^[a-zA-Z]*$/   
end
