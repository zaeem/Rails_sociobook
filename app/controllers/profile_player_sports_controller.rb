class ProfilePlayerSportsController < ApplicationController
  # GET /profile_player_sports
  # GET /profile_player_sports.xml
  def index
    @profile_player_sports = ProfilePlayerSport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_player_sports }
    end
  end

  # GET /profile_player_sports/1
  # GET /profile_player_sports/1.xml
  def show
    @profile_player_sport = ProfilePlayerSport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_player_sport }
    end
  end

  # GET /profile_player_sports/new
  # GET /profile_player_sports/new.xml
  def new
    @profile_player_sport = ProfilePlayerSport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_player_sport }
    end
  end

  # GET /profile_player_sports/1/edit
  def edit
    @profile_player_sport = ProfilePlayerSport.find(params[:id])
  end

  # POST /profile_player_sports
  # POST /profile_player_sports.xml
  def create
    @profile_player_sport = ProfilePlayerSport.new(params[:profile_player_sport])

    respond_to do |format|
      if @profile_player_sport.save
        format.html { redirect_to(@profile_player_sport, :notice => 'Profile player sport was successfully created.') }
        format.xml  { render :xml => @profile_player_sport, :status => :created, :location => @profile_player_sport }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_player_sport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_player_sports/1
  # PUT /profile_player_sports/1.xml
  def update
    @profile_player_sport = ProfilePlayerSport.find(params[:id])

    respond_to do |format|
      if @profile_player_sport.update_attributes(params[:profile_player_sport])
        format.html { redirect_to(@profile_player_sport, :notice => 'Profile player sport was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_player_sport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_player_sports/1
  # DELETE /profile_player_sports/1.xml
  def destroy
    @profile_player_sport = ProfilePlayerSport.find(params[:id])
    @profile_player_sport.destroy

    respond_to do |format|
      format.html { redirect_to(profile_player_sports_url) }
      format.xml  { head :ok }
    end
  end
end
