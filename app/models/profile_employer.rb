class ProfileEmployer < ActiveRecord::Base
  belongs_to :profile
  has_many :profile_employer_projects

  validates_length_of :title, :within => 3..20
  validates_format_of :title, :position, :with => /^[a-zA-Z]*$/  
  accepts_nested_attributes_for :profile_employer_projects, :allow_destroy => true
end
