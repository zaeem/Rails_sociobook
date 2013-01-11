class ProfileRelation < ActiveRecord::Base
  belongs_to :profile
  
  validates_format_of :family_name, :family_relation, :with => /^[a-zA-Z ]*$/
end
