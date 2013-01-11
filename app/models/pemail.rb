class Pemail < ActiveRecord::Base
  belongs_to :profile
 
 #  validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/   
end
