class Friend < ActiveRecord::Base
  belongs_to :profile
  has_many :friend_profile_groups

  def import_yahoo(current_user,yahoo_id,yahoo_password)
    c = Contacts.new(:yahoo, yahoo_id, yahoo_password).contacts
    if yahoo_id.length != 0
      current_user.profile.yahoo_id = yahoo_id
      current_user.profile.save
    end

    contact_list = []
    if c.length !=0  # there must be some contacts
      c.each do |t|
        contact_list << t
      end
      x=0
      while x < contact_list.length
        if contact_list[x][1].include? "@"
            @contacts.profile_id = current_user.profile.user_id
            @contacts.email_type = "yahoo"
            @contacts.email_id = contact_list[x][1]
            @contacts.desc = "whatever"
            @contacts.save
        end
        x=x+1
      end
      friend_profile_id_list = find_tobe_friends(contact_list,"yahoo")
      save_tobe_friends(friend_profile_id_list)
    end
  end

  def self.import_hotmail(current_user,params)
    c = Contacts.new(:hotmail, params[:hotmail_id], params[:hotmail_password]).contacts
    if params[:hotmail_id].length !=0
      current_user.profile.hotmail_id = params[:hotmail_id]
      current_user.profile.save
    end
    contact_list = []
    if c.length !=0  # there must be some contacts
      c.each do |t|
        contact_list << t
      end
      x=0
      puts contact_list.length
      while x < contact_list.length
        if contact_list[x][0].include? "@"
              @contacts = Contact.new
              @contacts.profile_id = current_user.profile.user_id
              @contacts.email_type = "hotmail"
              @contacts.email_id = contact_list[x][0]
              @contacts.desc = "whatever"
              @contacts.save
        end
        x=x+1
      end
      friend_profile_id_list = find_tobe_friends(contact_list,"hotmail")
      save_tobe_friends(friend_profile_id_list)
    end
  end

  def self.find_tobe_friends(current_user,contact_list , type)
    friends_profile_id = []
    @profiles = Profile.all
    if type == "yahoo"
      for profile in @profiles
        i=0
        while i < contact_list.length
          if profile[:yahoo_id] == contact_list[i][1] && profile[:id]!=current_user.profile.id
            friends_profile_id << profile[:id]
          end
          i+=1
        end
      end
    elsif type == "hotmail"
      for profile in @profiles
        i=0
        while i < contact_list.length
          if profile[:hotmail_id]== contact_list[i][0] && profile[:id]!=current_user.profile.id
            friends_profile_id << profile[:id]
          end
          i+=1
        end
      end
    else
      for profile in @profiles
        i=0
        while i < contact_list.length
          if profile[:gmail_id]== contact_list[i][0] && profile[:id]!=current_user.profile.id
            friends_profile_id << profile[:id]
          end
        end
        i+=1
      end
    end
    return  friends_profile_id
  end
  def self.save_tobe_friends(current_user,friend_profiles_id_list)
    @profile_id = current_user.profile.id
    for profile_id in friend_profiles_id_list
      @sender_friend = Friend.new
      @sender_friend.profile_id = @profile_id
      @sender_friend.friend_id = profile_id
      @sender_friend.status = "requester"
      @sender_friend.desc = "sender"

      @recipient_friend = Friend.new
      @recipient_friend.profile_id = profile_id
      @recipient_friend.friend_id = @profile_id
      @recipient_friend.status = "requestee"
      @recipient_friend.desc = "reciever"

      @sender_friend.save
      @recipient_friend.save
    end
  end
  def self.pending_request_friends(current_user)
    pending_friends_id = Friend.where("status=? and profile_id=?","requestee",current_user.profile.id).map(&:friend_id)
    profile_friends = Profile.where(:id=>pending_friends_id)
    profiles = Profile.where(:id => profile_friends).map(&:user_id)
    return User.where(:id => profiles)
  end

  def self.find_all_friends(current_user)
    profiles_friends = current_user.profile.friends.where("status = ?","friend").map(&:friend_id)
    profiles = Profile.where(:id => profiles_friends).map(&:user_id)
    return User.where(:id => profiles)
  end

  def self.find_friend
    find_friends_id =  Friend.find(:all,:select=>"distinct(profile_id)", :conditions=>["friend_id = ? or profile_id =?",
        current_user.profile.id ,current_user.profile.id]).map(&:profile_id)
    puts find_freinds_id.inspect
    if(find_friends_id.length != 0 )
      user_ids = Profile.where("id not in (?)",find_friends_id).map(&:user_id)
    else
      user_ids = Profile.all().map(&:user_id)
    end
    user_ids.delete(current_user.profile.id)

    @find_friend = User.where(:id => user_ids)
    @sug_friend_list = fetch_friends_suggestion
    return @sug_friend_list
  end

  def self.add_request_friend(current_user,id)
    profile = Profile.where("user_id =?",id)

    friends =  Friend.find(:all, :conditions=>["(friend_id =? and profile_id=?) or (friend_id=? and profile_id=?)",
        profile.first.id, current_user.profile.id ,current_user.profile.id,profile.first.id])

    for friend in friends
      friend.status = "friend"
      friend.save
    end

    #mailer code here===========================================
#    user = User.find(id)
#    reciever_name = user.first_name.capitalize + " " + user.last_name.capitalize
#    sender_name = current_user.first_name.capitalize + " " + current_user.last_name.capitalize
#    Notifier.deliver_add_friend_request_mail(sender_name, reciever_name, "mak000@gmail.com")
    #===========================================================
  end
  def self.find_request_friend(current_user,id)
    profile = Profile.where("user_id =?",id)
    puts id
    puts profile.first.id
    @sender_friend = Friend.new
    @sender_friend.profile_id = current_user.profile.id
    @sender_friend.friend_id = profile.first.id
    @sender_friend.status = "requester"
    @sender_friend.desc = "sender"

    @recipient_friend = Friend.new
    @recipient_friend.profile_id = profile.first.id
    @recipient_friend.friend_id = current_user.profile.id
    @recipient_friend.status = "requestee"
    @recipient_friend.desc = "reciever"

    @sender_friend.save
    @recipient_friend.save

    #mailer code here===========================================
#    user = User.find(id)
#    reciever_name = user.first_name.capitalize + " " + user.last_name.capitalize
#    sender_name = current_user.first_name.capitalize + " " + current_user.last_name.capitalize
#    puts "mailer------------------------------"
#    Notifier.deliver_friendship_request_mail(sender_name,reciever_name,"mak000@gmail.com")
    #===========================================================
  end
  def self.remove_request_friend(current_user,id)
    profile = Profile.where("user_id =?",id)
    friends = Friend.find(:all, :conditions=>["(friend_id =? and profile_id=?) or (friend_id=? and profile_id=?) and status=?",
        profile.first.id, current_user.profile.id ,current_user.profile.id,profile.first.id,"friend"])
    for friend in friends
      friend.delete
    end
  end

   # this is reject friend
  def self.remove_friend(current_user,id)
    profile = Profile.where("user_id =?",id)
    friends = Friend.find(:all, :conditions=>["(friend_id =? and profile_id=?) or (friend_id=? and profile_id=?) and (status=? or status=?)",
        profile.first.id, current_user.profile.id ,current_user.profile.id,profile.first.id,"requester","requestee"])
    for friend in friends
      friend.delete
    end
    #mailer code here ==========================================
#    user = User.find(id)
#    reciever_name = user.first_name.capitalize + " " + user.last_name.capitalize
#    sender_name = current_user.first_name.capitalize + " " + current_user.last_name.capitalize
#    Notifier.deliver_reject_friend_request_mail(sender_name,reciever_name,"mak000@gmail.com")
    #============================================================
  end
  

  def self.fetch_friends_suggestion(current_user)

    sfl = []
    temp_contact = friends_contacts(current_user)

    for c in temp_contact do
      sfl<< {:user_obj => c , :ctype => "contacts"}
    end

    temp_mutual = mutual_friends(current_user)
    for c in temp_mutual do
      sfl<< {:user_obj => c , :ctype => "mutual"}
    end

    temp_others = friends_others(current_user)
    for c in temp_others do
      sfl<< {:user_obj => c , :ctype => "other"}
    end
    puts sfl.inspect
    return sfl
  end

  def self.friends_contacts(current_user)
    contacts_emails = current_user.profile.contacts.map(&:email_id)
    profile_ids = Contact.find(:all,:select=>"distinct(profile_id)", :conditions=>["email_id in (?) ",contacts_emails]).map(&:profile_id)

    puts "----------before---------------"
    puts profile_ids.inspect
    profile_ids.delete(current_user.profile.id)
    puts profile_ids.inspect
    puts "----------after---------------"

    for u in profile_ids
      if(is_friend(current_user.profile.id,u) == true ||
            is_requester(current_user.profile.id,u) == true ||
            is_requestee(current_user.profile.id,u) == true)
        profile_ids.delete(u)
      end
    end

    user_ids = Profile.where(:id => profile_ids).map(&:user_id)
    contact_friends_users = User.where(:id => user_ids)
    return contact_friends_users
  end

  def self.mutual_friends(current_user)

    friend_ids = Friend.where("profile_id=? and status=?",current_user.profile.id,"friend").map(&:friend_id)
    puts "mutual friends"
    puts friend_ids
    friend_of_friends_ids = Friend.where("profile_id in (?) and status = ?" ,friend_ids,"friend").map(&:friend_id)
    puts friend_of_friends_ids.inspect
    friend_of_friends_ids.delete(current_user.profile.id.to_s)
    user_ids = Profile.where(:id => friend_of_friends_ids).map(&:user_id)
    user_ids.delete(current_user.profile.id)
    mutual_friends_users = User.where(:id => user_ids)

#    puts mutual_friends_users.inspect

    return mutual_friends_users
  end

  def self.friends_others(current_user)

    universities_name = current_user.profile.profile_universities.map(&:title)
    puts universities_name.inspect
    employers_name = current_user.profile.profile_employers.map(&:title)
    puts employers_name.inspect
#
#    profile_matched_universities = ProfileUniversity.where(:title => universities_name).map(&:profile_id)
    
    profile_matched_universities = ProfileUniversity.find(:all,:select=>"distinct(profile_id)", :conditions=>["title in (?) ",universities_name]).map(&:profile_id)
    puts profile_matched_universities.inspect

    profile_matched_employers = ProfileEmployer.find(:all,:select=>"distinct(profile_id)", :conditions=>["title in (?) ",employers_name]).map(&:profile_id)
    puts profile_matched_employers.inspect
#    profile_matched_employers = ProfileEmployer.where(:title => employers_name).map(&:profile_id)
#
#
    profile_matched_universities.delete(current_user.profile.id)
    puts profile_matched_universities.inspect

    profile_matched_employers.delete(current_user.profile.id)
    puts profile_matched_employers.inspect
    user_ids_uni = Profile.where(:id => profile_matched_universities).map(&:user_id)
    user_ids_emp = Profile.where(:id => profile_matched_employers).map(&:user_id)

    users_ids = user_ids_uni
    users_ids << user_ids_emp

    other_friends_users = User.where(:id => users_ids.uniq)
    return other_friends_users
#    return users_ids.uniq
  end

  def self.fetch_friends_hometown(current_user,params)
#    home_town_name = current_user.profile.contact_town
    if(params[:htown].blank? == false)
      user_ids =  Profile.find(:all,:select=>"distinct(user_id)", :conditions=>["contact_town in (?) ",params[:htown]]).map(&:user_id)
    elsif(params[:curr_city].blank? == false)
      user_ids =  Profile.find(:all,:select=>"distinct(user_id)", :conditions=>["contact_currentcity in (?) ",params[:curr_city]]).map(&:user_id)
    end

    user_ids.delete(current_user.id.to_s)
#    return User.where(:id => user_ids)
    return user_ids
  end
  def self.fetch_friends_university(current_user,params)

    puts "fetch_freinds_university"
#    universities_name = current_user.profile.profile_universities.map(&:title)

#    puts universities_name.inspect
    if(params[:university].blank? == false )
      profile_matched_universities = ProfileUniversity.find(:all,:select=>"distinct(profile_id)", :conditions=>["title in (?) ",params[:university]]).map(&:profile_id)
    elsif(params[:grad_school].blank? == false )
      profile_matched_universities = ProfileUniversity.find(:all,:select=>"distinct(profile_id)", :conditions=>["title in (?) ",params[:grad_school]]).map(&:profile_id)
    end
    puts profile_matched_universities.inspect

    profile_matched_universities.delete(current_user.profile.id)
    puts profile_matched_universities.inspect

    user_ids_uni = Profile.where(:id => profile_matched_universities).map(&:user_id)
    users_ids = user_ids_uni
    puts "length"
#    puts user_ids_uni.length

#    puts user_ids_uni.first.id

#    t= User.where(:id => users_ids.uniq)
##    puts t.first_name
#
#
#
#    t = User.where(:id => users_ids.uniq)
    return users_ids.uniq
  end
  def self.fetch_friends_employer(current_user,params)
   puts "fetch_friends_employer"
#    employers_name = current_user.profile.profile_employers.map(&:title)
#    puts employers_name.inspect

    profile_matched_employers = ProfileEmployer.find(:all,:select=>"distinct(profile_id)", :conditions=>["title in (?) ",params[:employer]]).map(&:profile_id)
    puts profile_matched_employers.inspect
   
    profile_matched_employers.delete(current_user.profile.id)
    puts profile_matched_employers.inspect

    user_ids_emp = Profile.where(:id => profile_matched_employers).map(&:user_id)
    users_ids = user_ids_emp
#    return User.where(:id => users_ids.uniq)
    return users_ids.uniq
  end

  def self.fetch_friends_city(params)
  end
  
  def self.is_friend(profile_id,friend_id)
    find_friends_id =  Friend.find(:all, :conditions=>["profile_id = ? and friend_id = ? and status = ?",
                      profile_id ,friend_id,"friend"]).map(&:id)
   if (find_friends_id.empty?)
      return false
    else
      return true
    end
  end
  def self.is_requester(profile_id,friend_id)
    find_requester_id =  Friend.find(:all, :conditions=>["profile_id = ? and friend_id = ? and status = ?",
                      profile_id ,friend_id,"requester"]).map(&:id)
   if (find_requester_id.empty?)
      return false
    else
      return true
    end
  end
  def self.is_requestee(profile_id,friend_id)
    find_requester_id =  Friend.find(:all, :conditions=>["profile_id = ? and friend_id = ? and status = ?",
                      profile_id ,friend_id,"requestee"]).map(&:id)
   if (find_requester_id.empty?)
      return false
    else
      return true
    end
  end

end
