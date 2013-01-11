class FriendProfileGroupsController < ApplicationController
  # GET /friend_profile_groups
  # GET /friend_profile_groups.xml
  def index
    @friend_profile_groups = FriendProfileGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friend_profile_groups }
    end
  end

  # GET /friend_profile_groups/1
  # GET /friend_profile_groups/1.xml
  def show
    @friend_profile_group = FriendProfileGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @friend_profile_group }
    end
  end

  # GET /friend_profile_groups/new
  # GET /friend_profile_groups/new.xml
  def new
    @friend_profile_group = FriendProfileGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @friend_profile_group }
    end
  end

  # GET /friend_profile_groups/1/edit
  def edit
    @friend_profile_group = FriendProfileGroup.find(params[:id])
  end

  # POST /friend_profile_groups
  # POST /friend_profile_groups.xml
  def create
    @friend_profile_group = FriendProfileGroup.new(params[:friend_profile_group])

    respond_to do |format|
      if @friend_profile_group.save
        format.html { redirect_to(@friend_profile_group, :notice => 'Friend profile group was successfully created.') }
        format.xml  { render :xml => @friend_profile_group, :status => :created, :location => @friend_profile_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @friend_profile_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friend_profile_groups/1
  # PUT /friend_profile_groups/1.xml
  def update
    @friend_profile_group = FriendProfileGroup.find(params[:id])

    respond_to do |format|
      if @friend_profile_group.update_attributes(params[:friend_profile_group])
        format.html { redirect_to(@friend_profile_group, :notice => 'Friend profile group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friend_profile_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_profile_groups/1
  # DELETE /friend_profile_groups/1.xml
  def destroy
    @friend_profile_group = FriendProfileGroup.find(params[:id])
    @friend_profile_group.destroy

    respond_to do |format|
      format.html { redirect_to(friend_profile_groups_url) }
      format.xml  { head :ok }
    end
  end
end
