class ProfileTeamSportsController < ApplicationController
  # GET /profile_team_sports
  # GET /profile_team_sports.xml
  def index
    @profile_team_sports = ProfileTeamSport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_team_sports }
    end
  end

  # GET /profile_team_sports/1
  # GET /profile_team_sports/1.xml
  def show
    @profile_team_sport = ProfileTeamSport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_team_sport }
    end
  end

  # GET /profile_team_sports/new
  # GET /profile_team_sports/new.xml
  def new
    @profile_team_sport = ProfileTeamSport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_team_sport }
    end
  end

  # GET /profile_team_sports/1/edit
  def edit
    @profile_team_sport = ProfileTeamSport.find(params[:id])
  end

  # POST /profile_team_sports
  # POST /profile_team_sports.xml
  def create
    @profile_team_sport = ProfileTeamSport.new(params[:profile_team_sport])

    respond_to do |format|
      if @profile_team_sport.save
        format.html { redirect_to(@profile_team_sport, :notice => 'Profile team sport was successfully created.') }
        format.xml  { render :xml => @profile_team_sport, :status => :created, :location => @profile_team_sport }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_team_sport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_team_sports/1
  # PUT /profile_team_sports/1.xml
  def update
    @profile_team_sport = ProfileTeamSport.find(params[:id])

    respond_to do |format|
      if @profile_team_sport.update_attributes(params[:profile_team_sport])
        format.html { redirect_to(@profile_team_sport, :notice => 'Profile team sport was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_team_sport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_team_sports/1
  # DELETE /profile_team_sports/1.xml
  def destroy
    @profile_team_sport = ProfileTeamSport.find(params[:id])
    @profile_team_sport.destroy

    respond_to do |format|
      format.html { redirect_to(profile_team_sports_url) }
      format.xml  { head :ok }
    end
  end
end
