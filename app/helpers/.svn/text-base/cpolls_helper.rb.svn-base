module CpollsHelper

  def is_shared(friend_id)
    find_friends_id =  Cpshare.find(:all, :conditions=>["profile_id = ? ", friend_id]).map(&:id)
    if (find_friends_id.length!= 0)
      return true
    else
      return false
    end
  end

  def get_total_votes_against_poll(cpoll_id)
    total_votes = Cpshare.find(:all, :conditions=>["cpoll_id = ? and option != 0", cpoll_id]).map(&:id)
    return total_votes.length
  end

  def find_friends_against_option(option_id)
   profile_ids =  Cpshare.find(:all, :conditions=>["option = ? ", option_id]).map(&:profile_id)
   profiles = Profile.where(:id => profile_ids).map(&:user_id)
   return  User.where(:id => profiles)
 end
 
  def is_share(profile_id, poll_id)
    find_friends_id =  Cpshare.find(:all, :conditions=>["profile_id = ? and cpoll_id = ?", profile_id, poll_id]).map(&:id)
    if (find_friends_id.length!= 0)
      return true
    else
      return false
    end
  end
end
