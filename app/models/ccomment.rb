class Ccomment < ActiveRecord::Base
  default_scope :order => 'created_at DESC'
  belongs_to :content
  

  
  scope :typed_like, where(:type_ => 'like')
  scope :typed_dislike, where(:type_ => 'like')
  scope :typed_comment, where(:type_ => 'comment')

end
