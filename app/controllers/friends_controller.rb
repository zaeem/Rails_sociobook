require 'rubygems'
require 'csv'
include ApplicationHelper
class FriendsController < ApplicationController
  before_filter :require_user
  def import_yahoo
    begin
      #      import_yahoo(current_user,params)
      c = Contacts.new(:yahoo, params[:yahoo_id], params[:yahoo_password]).contacts
    rescue Exception => e
      flash[:notice] = "Invalid user name or password"
      return redirect_to new_friends_path
    end

    if params[:yahoo_id].length != 0
      current_user.profile.yahoo_id = params[:yahoo_id]
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
          #          contacts_list = Contact.where("email_id =?", contact_list[x][1])
          #          if(contact_list.length ==0)
          #            @contacts = Contact.new
          @contacts.profile_id = current_user.profile.user_id
          @contacts.email_type = "yahoo"
          @contacts.email_id = contact_list[x][1]
          @contacts.desc = "whatever"
          @contacts.save
          #         end
        end
        x=x+1
      end
      friend_profile_id_list = find_tobe_friends(contact_list,"yahoo")
      save_tobe_friends(friend_profile_id_list)
    end
    redirect_to(new_friends_path)
  end
  def import_hotmail
    begin
      #      Friend.import_hotmail(current_user,params)
      c = Contacts.new(:hotmail, params[:hotmail_id], params[:hotmail_password]).contacts
    rescue Exception => e
      flash[:notice] = "Invalid user name or password"
      return redirect_to new_friends_path
    end

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
          #contacts_list = Contact.where(:email_id => contact_list[x][0])
          #puts contact_list.inspect
          #if(contact_list.length ==0)
          @contacts = Contact.new
          @contacts.profile_id = current_user.profile.user_id
          @contacts.email_type = "hotmail"
          @contacts.email_id = contact_list[x][0]
          @contacts.desc = "whatever"
          @contacts.save
          #end
        end
        x=x+1
      end
      friend_profile_id_list = Friend.find_tobe_friends(current_user,contact_list,"hotmail")
      Friend.save_tobe_friends(current_user,friend_profile_id_list)
    end
    redirect_to(new_friends_path)
  end
  def import_gmail
    begin
      c = Contacts.new(:gmail, params[:gmail_id], params[:gmail_password]).contacts
    rescue Exception => e
      flash[:notice] = "Invalid user name or password"
      return redirect_to new_friends_path
    end
    # saving input email
    if params[:gmail_id].length != 0
      current_user.profile.gmail_id = params[:gmail_id]
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
          #          contacts_list = Contact.where("email_id =?", contact_list[x][1])
          #          if(contact_list.length ==0)
          @contacts = Contact.new
          @contacts.profile_id = current_user.profile.user_id
          @contacts.email_type = "gmail"
          @contacts.email_id = contact_list[x][1]
          @contacts.desc = "whatever"
          @contacts.save
          #          end
        end
        x=x+1
      end
      friend_profile_id_list = find_tobe_friends(contact_list,"gmail")
      save_tobe_friends(friend_profile_id_list)
    end
    redirect_to(new_friends_path)
  end

  private

  def find_tobe_friends(contact_list , type)
    return Friend.find_tobe_friends(current_user,contact_list,type)
  end

  def save_tobe_friends(friend_profiles_id_list)
    Friend.save_tobe_friends(current_user,friend_profiles_id_list)
  end

  public
  
  def show_friend
    @wall_menus = true
    @vuser=current_user
    @all_friends = find_all_friends
  end

  def pending_request_friend
    #    @main_menus = true
    @manage_menus = true
    @vuser=current_user
    @pending_friends = Friend.pending_request_friends(current_user)
    @all_friends = Friend.find_all_friends(current_user)
  end
  def list_friend
    #    @main_menus = true
    @manage_menus = true
    @vuser=current_user
    @pending_friends = Friend.pending_request_friends(current_user)
    @all_friends = Friend.find_all_friends(current_user)
  end


  def import_contact
    @main_menus = true
    @stepsFriend = true
    @header = 1
    @step = 1
    @pending_friends = Friend.pending_request_friends(current_user)
    @sug_friend_list = fetch_friends_suggestion(true)
  end

  def find_friend
    @main_menus = true
    find_friends_id =  Friend.find(:all,:select=>"distinct(profile_id)", :conditions=>["friend_id = ? or profile_id =?",
        current_user.profile.id ,current_user.profile.id]).map(&:profile_id)
    if(find_friends_id.length != 0 )
      user_ids = Profile.where("id not in (?)",find_friends_id).map(&:user_id)
    else
      user_ids = Profile.all().map(&:user_id)
    end
    user_ids.delete(current_user.profile.id)

    puts find_friends_id.inspect
    puts user_ids.inspect

    @vuser=current_user
    @find_friend = User.where(:id => user_ids)
    puts @find_friends.inspect
    @sug_friend_list = fetch_friends_suggestion(true)
    return @sug_friend_list
  end

  # adding a pending request as friend
  def add_request_friend
    Friend.add_request_friend(current_user,params[:id])
    return redirect_to import_contact_friends_path
  end

  # request for a friend , using find 
  def find_request_friend
    Friend.find_request_friend(current_user,params[:id])
    return redirect_to find_friend_friends_path
  end

  def remove_request_friend
    Friend.remove_request_friend(current_user,params[:id])
    return redirect_to list_friend_friends_path
  end

  # this is reject friend
  def remove_friend
    Friend.remove_friend(current_user,params[:id])
    return redirect_to pending_request_friend_friends_path
  end

  # this is reject friend
  def fetch_phone_contact
    Friend.remove_friend(current_user,params[:id])
    return redirect_to pending_request_friend_friends_path
  end

  def import_file
    Friend.import_file(params[:import][:file])
    contact_list = []
    friend_profile_id_list=[]
    if params[:import][:file].size.zero? then
      flash[:notice] = 'Forgot to upload some data'
      return redirect_to(import_contact_friends_path)
    end

    begin
      email_type=" "
      CSV::Reader.parse(params[:import][:file]) do |row|
        profile_id = current_user.profile.id
        email_id = row[0]
        email_type = row[2]
        desc = row[3]

        contact_list << email_id
        c = Contact.new
        c.profile_id = profile_id
        c.email_id = email_id
        c.email_type = email_type
        c.desc = desc
        c.save

        if email_type == "hotmail"
          friend_profile_id_list = find_import_csv_friends(contact_list,"hotmail")
          puts friend_profile_id_list.inspect
          puts "hotmail"
        elsif email_type == "yahoo"
          friend_profile_id_list = find_import_csv_friends(contact_list,"yahoo")
          puts "yahoo"
        else
          friend_profile_id_list = find_import_csv_friends(contact_list,"gmail")
          puts "gmail"
        end
      end

      save_tobe_friends(friend_profile_id_list)
      return redirect_to(import_contact_friends_path)

    rescue Exception => e
      flash[:notice] = 'csv file format error'
    end
  end

  def filter_friends_suggestion
    fetch_friends_suggestion(false)
    
    #    render fetch_friends_suggestion_friends_path
  end
  def fetch_friends_suggestion(ff=false)
    sfl = []
    puts "HERE"
    if(params[:friend_ids].blank? == false)
      mf = []
      puts "HEREHERE"
      puts params[:friend_ids].inspect
      puts params[:friend_ids].length
      for mf_id in params[:friend_ids]
        user = User.find(mf_id)
        mf << Friend.mutual_friends(user)
      end

      users_list = fetch_users_list(mf)
      user_profiles_list = fetch_profiles_list(mf)

      puts user_profiles_list.inspect

      if (params[:university].blank? == true  &&
            params[:employer].blank? == true &&
            params[:htown].blank? == true &&
            params[:curr_city].blank? == true &&
            params[:grad_school].blank? == true)
        @special = true
        @sug_friend_list = users_list
      else
        for profile in user_profiles_list do
          query = buildQuery(params,profile)
        end

        puts "++++++++++++++++++++++++++++______#{query}___________++++++++++++++++++++++++++++++++"
        user_sug_friend_list = Profile.find(:all, :conditions => query).map(&:user_id)
#        user_list = user_sug_friend_list.map(&:user_id)
#        puts user_list.inspect

        @sug_friend_list = User.find(:all,:conditions=>["id in (?)",user_sug_friend_list.join(",")])
      end
      
    else
      if(params[:university].blank? == false)
        sp=true
        sfl << fetch_friends_university(params)
      end
      if(params[:employer].blank? == false )
        sp =true
        sfl << fetch_friends_employer(params)
      end
      if(params[:htown].blank? == false)
        sp=true
        
        sfl << fetch_friends_hometown(params)
      end
      if(params[:curr_city].blank? == false)
        sp=true
        sfl << fetch_friends_hometown(params)
      end
      if(params[:grad_school].blank? == false)
        sp=true
        puts "yup"
        sfl << fetch_friends_university(params)
      end
      if (params[:university].blank? == true  &&
            params[:employer].blank? == true &&
            params[:htown].blank? == true &&
            params[:curr_city].blank? == true &&
            params[:grad_school].blank? == true)
        @special = false
        @sug_friend_list = Friend.fetch_friends_suggestion(current_user)
      end
    end

    if(sp == true)
      sfl = convert_into_list(sfl)
      @sug_friend_list = User.where(:id => sfl)
      @special = sp
    end

    # when not called from find_friend
    if(ff == false)
      return render fetch_friends_suggestion_friends_path
    end
    return @sug_friend_list
  end

  def buildQuery(params,profile)

#    str = "select * from profile"
    str = ""

    if(params[:university].blank? == false || params[:employer].blank? == false)
      str += ", profile_universities pu , profile_employers pe"
      str +=" pu.profile_id == pe.profile_id"
    end

    if(params[:htown].blank? == false)
      str+=" profiles.contact_home == \"#{params[:htown]}\""
    end
    if(params[:curr_city].blank? == false)
      if(params[:htown].blank? == false)
        str+=" and "
      end
      str+=" profiles.contact_currentcity == \"#{params[:curr_city]}\""
    end
    if(params[:university].blank? == false)
      if(params[:htown].blank? == false || params[:curr_city].blank? == false)
        str+=" and "
      end
      str+=" profile_unversities.title == \"#{params[:university]}\""
    end

    if(params[:grad_school].blank? == false)
      if(params[:university].blank? == false || params[:htown].blank? == false || params[:curr_city].blank? == false)
        str+=" and "
      end
      str+=" profile_universities.title == \"#{params[:grad_school]}\""
    end
    if(params[:employer].blank? == false )
      if(params[:grad_school].blank? == false ||
            params[:htown].blank? == false ||
            params[:curr_city].blank? == false ||
            params[:employer].blank? == false )
        str+=" and "
      end
      str+=" profile_employers.title == \"#{params[:employer]}\""
    end
    str += " and profiles.id == 4 "
    puts str
    return str
  end
  def fetch_profiles_list(mf)
    profiles =[]
    for s in mf do
      for y in s do
        #       puts y.inspect
        p = y.profile
        profiles << p
      end
    end
    return profiles
  end

  def fetch_users_list(mf)
    users =[]
    for s in mf do
      for y in s do
        #       puts y.inspect
        users << y
      end
    end
    return users
  end
  def convert_into_list(sfl)
    list =[]
    for s in sfl do
      for y in s do
        list << y
      end
    end
    puts list.inspect
    return list.uniq
  end


  def fetch_friends_hometown(params)
    @sug_friend_list = Friend.fetch_friends_hometown(current_user,params)
  end
  def fetch_friends_university(params)
    @sug_friend_list = Friend.fetch_friends_university(current_user,params)
    
  end
  def fetch_friends_employer(params)
    @sug_friend_list = Friend.fetch_friends_employer(current_user,params)
  end
  def fetch_friends_city(params)
    @sug_friend_list = Friend.fetch_friends_city(current_user,params)
  end

  # GET /friends
  # GET /friends.xml
  def index
    @friends = Friend.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friends }
    end
  end

  # GET /friends/1
  # GET /friends/1.xml
  def show
    @friend = Friend.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @friend }
    end
  end

  # GET /friends/new
  # GET /friends/new.xml
  def new
    @friend = Friend.new
    @step = 1
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @friend }
    end
  end

  # GET /friends/1/edit
  def edit
    @friend = Friend.find(params[:id])
  end

  # PUT /friends/1
  # PUT /friends/1.xml
  def update
    @friend = Friend.find(params[:id])

    respond_to do |format|
      if @friend.update_attributes(params[:friend])
        format.html { redirect_to(@friend, :notice => 'Friend was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friend.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.xml
  def destroy
    @friend = Friend.find(params[:id])
    @friend.destroy

    respond_to do |format|
      format.html { redirect_to(friends_url) }
      format.xml  { head :ok }
    end
  end
end