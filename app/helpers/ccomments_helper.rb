module CcommentsHelper
  def nooflikes(ccomment_id)
    Ccomment.find(ccomment_id).nooflike
  end
  
  def like_user(content_id)
    profile_ids = Ccomment.where(:content_id => content_id, :desc => "like").map(&:profile_id)
    profiles = Profile.where(:id => profile_ids).map(&:user_id)
    return User.where(:id => profiles)
  end
  
  def dislike_user(content_id)
    profile_ids = Ccomment.where(:content_id => content_id, :desc => "dislike").map(&:profile_id)
    profiles = Profile.where(:id => profile_ids).map(&:user_id)
    return User.where(:id => profiles)
  end
end
