class Cevent < ActiveRecord::Base

 belongs_to :content
 
    has_attached_file :ephoto ,
    :styles => {
      :thumb=> "120x120",
      :small  => "250x250",
       :large => "600x600"}  ,:default_url => 'default_thumbnail.png',:thumb => 'default_thumbnail.png'

end
