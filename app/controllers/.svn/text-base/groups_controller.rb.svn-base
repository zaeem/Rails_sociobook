class GroupsController < ApplicationController
  # GET /groups
  # GET /groups.xml
  
#  uses_tiny_mce(:options => AppConfig.default_mce_options, :only => [:new, :edit])
  
  def index
    @groups = Group.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    @group = Group.find(params[:id])
  end


  # GET /groups/1/edit
  def egroup
#    @wall_menus =true
    @group = Group.new
    @group.members.first || @group.members.build
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
    
  end


  
   # GET /groups/1/edit
  def vgroup
    @vgroup_menus =true
#    @group = Group.new
    @group= Group.find_by_id(params[:gid])
     @pv= params[:pv]
#    @group.members.first || @group.members.build
    @vuser = current_user
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
    
  end

  
  # GET /groups/1/edit
  def listgroup
       @vuser= current_user
       @wall_menus =true
       @group_menus = true
#       @group = Group.find(params[:id])
       @group= Group.find_by_id(params[:id])
       
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @group }
#    end
#    
  end

  # POST /groups
  # POST /groups.xml
  def create
    #    return render :text => ok
    @group = Group.new(params[:group])
    @profile_ids = Profile.where(:user_id => params[:friend_ids]).map(&:id)
    profiles = Profile.find(:all, :conditions => ["id in (#{@profile_ids.join(",")})"])
    respond_to do |format|
      if @group.save
          @group.profiles << profiles
        return redirect_to ewall_contents_path(:id => current_user.profile.id ,:sk => 'status', :pv => 'g',  :vd => @group.id) 
        #        format.html { redirect_to(@group, :notice => 'Group was successfully created.') }
        #        format.xml  { render :xml => @group, :status => :created, :location => @group }
      else
      @errors = []
      @group.errors.full_messages.each do |msg|
        @errors << "#{msg}" unless msg.blank?
      end
      flash[:error] = @errors
      return redirect_to ewall_contents_path(:id => current_user.profile.id ,:sk => 'status', :pv => 'g',  :vd => @group.id) 
        #        format.html { render :action => "new" }
        #        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
#        format.html { redirect_to(@group, :notice => 'Group was successfully updated.') }
         return redirect_to ewall_contents_path(:id => current_user.profile.id ,:sk => 'status', :pv => 'g',  :vd => @group.id) 
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
end
