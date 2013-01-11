class ProfileActivitiesController < ApplicationController
  # GET /profile_activities
  # GET /profile_activities.xml
  def index
    @profile_activities = ProfileActivity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_activities }
    end
  end

  # GET /profile_activities/1
  # GET /profile_activities/1.xml
  def show
    @profile_activity = ProfileActivity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_activity }
    end
  end

  # GET /profile_activities/new
  # GET /profile_activities/new.xml
  def new
    @profile_activity = ProfileActivity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_activity }
    end
  end

  # GET /profile_activities/1/edit
  def edit
    @profile_activity = ProfileActivity.find(params[:id])
  end

  # POST /profile_activities
  # POST /profile_activities.xml
  def create
    @profile_activity = ProfileActivity.new(params[:profile_activity])

    respond_to do |format|
      if @profile_activity.save
        format.html { redirect_to(@profile_activity, :notice => 'Profile activity was successfully created.') }
        format.xml  { render :xml => @profile_activity, :status => :created, :location => @profile_activity }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_activities/1
  # PUT /profile_activities/1.xml
  def update
    @profile_activity = ProfileActivity.find(params[:id])

    respond_to do |format|
      if @profile_activity.update_attributes(params[:profile_activity])
        format.html { redirect_to(@profile_activity, :notice => 'Profile activity was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_activity.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_activities/1
  # DELETE /profile_activities/1.xml
  def destroy
    @profile_activity = ProfileActivity.find(params[:id])
    @profile_activity.destroy

    respond_to do |format|
      format.html { redirect_to(profile_activities_url) }
      format.xml  { head :ok }
    end
  end
end
