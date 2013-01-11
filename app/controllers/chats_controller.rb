class ChatsController < ApplicationController
require 'net/http'
  before_filter :require_user
  def update_chat_status
    profile_ids = current_user.profile.friends.all(:select => "distinct(friend_id)").map(&:friend_id)
    profile_ids <<  Friend.all(:select => "distinct(profile_id)",:conditions => ["friend_id = #{current_user.profile.id}"]).map(&:profile_id)
    profile_ids = profile_ids.join(",").chomp(",")
    all_users = User.all(:select => "login, last_login_at, status",:conditions => ["id in (select user_id from profiles where profiles.id in (#{profile_ids}))"])
    offline = []
    online = []
    away = []
    busy = []
    all_users.each do |item|
      if((item.last_login_at > (Time.now - 1.minutes)) && item.status == 0)
        online << item.login 
      elsif(item.status == 2)
        away << item.login
      elsif(item.status == 3)
        busy << item.login
      else
        offline << item.login
      end
    end
    chats = Chat.all(:conditions => ["`to` like ? and id > #{current_user.last_chat_count}", "%#{current_user.login}%"])
    current_user.last_chat_count = [(chats.map(&:id).max || 0), (current_user.last_chat_count)].max
    current_user.last_login_at = Time.now
    current_user.save(false)
    return render :json => {:offline => offline || nil, :online => online || nil,:away => away||nil, :busy => busy||nil, :chats => chats}
  end
  def send_chat
    if params[:to] == "Phone-923004200045"
      Net::HTTP.get(URI.parse("http://api.clickatell.com/http/sendmsg?user=asif.subhani&password=Lums_123&api_id=3312038&to=923004200045&text=#{CGI::escape(params[:message])}"))
      return render :text => "ok"
    end
    recipients = params[:to]
    trimmed = recipients.split("Group-").last
    puts "trimmed #{trimmed}"
    unless recipients == trimmed
      puts "trimmed #{trimmed} hhhhhh"
      group = Group.find_by_name(trimmed)
      puts "group --> #{group.inspect}"
      members_login = []
      group.profiles.each do |group_profile|
        members_login << group_profile.user.login  
      end
      members_login = members_login.join(",")
      puts "group --> #{members_login}"
      recipients = "#{group.profile.user.login}, #{members_login}"
      puts "recipent --> #{recipients}"

    end
    current_user.chats.create!(:from => current_user.login ,:to => recipients.gsub(current_user.login, ""), :message => params[:message], :group_name => params[:to])
    
    return render :text => "ok"
  end
  def set_status
    current_user.status = params[:new_status]
    current_user.save(false)
    return render :text => "ok"
  end
end
