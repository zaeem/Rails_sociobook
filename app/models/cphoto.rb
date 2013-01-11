class Cphoto < ActiveRecord::Base
  belongs_to :content
  has_many :ctags
  has_many :pcomments
  
  accepts_nested_attributes_for  :pcomments,  :allow_destroy => true
  has_attached_file :photo ,:default_url => 'default_thumbnail.png'
  has_attached_file :photo ,
    :styles => {
      :thumb=> "120x120",
      :small  => "250x250",
       :large => "600x600"}
end
