class ProfileUniversity < ActiveRecord::Base
    belongs_to :profile
    has_many :profile_university_classes
 
    validates_length_of :title, :within => 3..20
    validates_format_of :title, :with => /^[a-zA-Z]*$/  
    accepts_nested_attributes_for :profile_university_classes, :allow_destroy => true
end
