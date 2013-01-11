module CphotosHelper
  def get_content(photo_id)
    content = Cphoto.where(:id => photo_id).map(&:content_id)
    return Content.where(:id => content).first
  end
  
  def get_comment(comment_id)
    return Ccomment.where(:id => comment_id).first
  end
end
