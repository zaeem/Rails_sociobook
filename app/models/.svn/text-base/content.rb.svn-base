 class Content < ActiveRecord::Base
  
  default_scope :order => 'created_at DESC'
  belongs_to :profile
 # belongs_to :album
  has_one :cstatus
#  has_one :cphoto
  has_one :cvideo
  has_one :clink
  has_one :cpoll
  has_one :cevent
  has_one :cadd
  has_many :ccomments
  has_many :cphotos  
   
   
#theme "purple"   
#   
#def profile
#  self.album.profile 
#end 
  accepts_nested_attributes_for  :cstatus, :allow_destroy => true
  accepts_nested_attributes_for  :ccomments,  :allow_destroy => true
  accepts_nested_attributes_for  :cvideo,  :allow_destroy => true
  accepts_nested_attributes_for  :cphotos,  :allow_destroy => true
  accepts_nested_attributes_for  :cpoll, :allow_destroy => true
  accepts_nested_attributes_for  :clink,  :allow_destroy => true
  accepts_nested_attributes_for  :clink,  :allow_destroy => true
  accepts_nested_attributes_for  :cadd,  :allow_destroy => true
  accepts_nested_attributes_for  :cevent,  :allow_destroy => true

end
