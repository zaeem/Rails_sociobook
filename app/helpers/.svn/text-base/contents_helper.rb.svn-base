module ContentsHelper

#  def all_contents(flag, profile_id)
#    if(flag == 'w')
##     if w and profile_id == current_user 
##      and if flag 3 
##      and  if flag is 2 and vprofile current_user.profile   
#Cont
#      return Content.where("profile_id =?", profile_id)
#    elsif(flag == 'f' )
#      return Content.where(["flag = ? or flag = ? or profile_id =?","2" ,"3",current_user.profile.id ]).all
#    end
#
#  end

  def all_contents(flag, profile_id)
         return Content.all#where(["flag = ? or flag = ? or profile_id =?","2" ,"3",profile_id ]).all   
  end

 def all_contents_adds()
    
   Content.find_all_by_type_("cadd") 
#    return Content.all#where(["flag = ? or flag = ? or profile_id =?","2" ,"3",profile_id ]).all   
  end

  def get_content_notifications
    return Content.where(["profile_id =? and poster_id !=?", current_user.profile.id, current_user.profile.id ]);
  end
  
  def get_comment_notifications
    return Ccomment.where(["postedagainst =?", current_user.profile.id ]);
  end

  def content_defaultalbum_id(profile_id)
    profile = Profile.find(profile_id).contents.find_by_name("default").id
    return Content.find(profile)
  end
      
    def album_photos(profile_id, content_id)
     Profile.find(profile_id).contents.find(content_id).cphotos.all
    end

    
    def getallalbums(profile_id)
      Profile.find(profile_id).contents.find_all_by_type_("photo")
    end

	def create_content
      new_content = Content.new
      new_content.cvideo = Cvideo.new
      return new_content
  end

  def create_content_question
      new_content = Content.new
      new_content.cpoll = Cpoll.new
      return new_content
  end

   def create_content_album
      new_content = Content.new
      new_content.cphotos.build
      return new_content
  end  
end
