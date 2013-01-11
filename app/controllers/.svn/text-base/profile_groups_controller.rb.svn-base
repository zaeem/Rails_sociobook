include ApplicationHelper
class ProfileGroupsController < ApplicationController

  def add_group
    @profile_group = ProfileGroup.new
    @all_friends = find_all_friends
    @header = 2
  end

  def add_friend_to_group
    @header = 2
    profile_ids = Profile.where(:user_id => params[:friend_ids])
    @friend_ids = Friend.where("status=? and friend_id in (?) and profile_id=?","friend",profile_ids,current_user.profile.id)
    if !@friend_ids.blank?
      @profile_group = ProfileGroup.new(params[:profile_group])
      @profile_group.profile_id = current_user.profile.id
      if @profile_group.save
        for friend in @friend_ids
          @friends_to_group = friend.friend_profile_groups.build(:profile_group_id =>  @profile_group.id)
          @friends_to_group.save
        end
      else
        @error = []
        @profile_group.errors.full_messages.each do |msg|
          if !msg.blank?
            @error << "#{msg}"
          end
        end
        flash[:notice] = @error
        return redirect_to add_group_profile_groups_path
      end
    else
      flash[:notice] = "Unable to create groups without selecting friends"
      return redirect_to add_group_profile_groups_path
    end
    return redirect_to profile_groups_path
  end

  def remove_friend
    @header = 2
    profile_id = Profile.where(:user_id => params[:friend_id]).first
    friend = Friend.where("status=? and friend_id in (?) and profile_id=?","friend",profile_id, current_user.profile.id).first
    #friend = Friend.where("profile_id=?", profile_id).first
    group = ProfileGroup.where(:id => params[:group_id]).first
    puts friend
    
    friend_group = friend.friend_profile_groups.first(:conditions => ["profile_group_id = ?",group.id])
    friend_group &&= friend_group.destroy
    return redirect_to(profile_groups_path)
  end
  
  # GET /profile_groups
  def index
    @profile_groups = ProfileGroup.find_all_by_profile_id(current_user.profile.id)
  end

  # GET /profile_groups/1/edit
  def edit
    @profile_group = ProfileGroup.find(params[:id])
  end

  # PUT /profile_groups/1
  def update
    @profile_group = ProfileGroup.find(params[:id])
    if @profile_group.update_attributes(params[:profile_group])
      flash[:notice] = "Group was successfully updated"
      return redirect_to  profile_groups_path
    else
      flash[:notice] = @profile_group.errors.full_messages
      render :action => "edit"
    end
  end

  # DELETE /profile_groups/1
  def destroy
    @profile_group = ProfileGroup.find(params[:id])
    @profile_group.destroy
    flash[:notice] = "Group deleted successfully"
    redirect_to profile_groups_path
    
  end


  def new
    @profile_group = ProfileGroup.new
  end

  # GET /profile_groups/1
  def show
    @profile_group = ProfileGroup.find(params[:id])
    @profile_group.destroy
    flash[:notice] = "Group was deleted successfully"
    return redirect_to add_group_profile_groups_path
 
    #    @profile_group = ProfileGroup.find(params[:id])
    #    @group_id  = params[:id]
    #    respond_to do |format|
    #      format.html # show.html.erb
    #      format.xml  { render :xml => @profile_group }
    #    end
  end

  
  # POST /profile_groups
  # POST /profile_groups.xml
  def create
    @profile_group = ProfileGroup.new(params[:profile_group])
    @profile_group.profile_id = current_user.profile.id

    respond_to do |format|
      if @profile_group.save
        format.html { redirect_to(@profile_group, :notice => 'Profile group was successfully created.') }
        format.xml  { render :xml => @profile_group, :status => :created, :location => @profile_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  
end