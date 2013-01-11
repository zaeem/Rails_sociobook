class ProfilePlaySportsController < ApplicationController
  # GET /profile_play_sports
  # GET /profile_play_sports.xml
  def index
    @profile_play_sports = ProfilePlaySport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_play_sports }
    end
  end

  # GET /profile_play_sports/1
  # GET /profile_play_sports/1.xml
  def show
    @profile_play_sport = ProfilePlaySport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_play_sport }
    end
  end

  # GET /profile_play_sports/new
  # GET /profile_play_sports/new.xml
  def new
    @profile_play_sport = ProfilePlaySport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_play_sport }
    end
  end

  # GET /profile_play_sports/1/edit
  def edit
    @profile_play_sport = ProfilePlaySport.find(params[:id])
  end

  # POST /profile_play_sports
  # POST /profile_play_sports.xml
  def create
    @profile_play_sport = ProfilePlaySport.new(params[:profile_play_sport])

    respond_to do |format|
      if @profile_play_sport.save
        format.html { redirect_to(@profile_play_sport, :notice => 'Profile play sport was successfully created.') }
        format.xml  { render :xml => @profile_play_sport, :status => :created, :location => @profile_play_sport }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_play_sport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_play_sports/1
  # PUT /profile_play_sports/1.xml
  def update
    @profile_play_sport = ProfilePlaySport.find(params[:id])

    respond_to do |format|
      if @profile_play_sport.update_attributes(params[:profile_play_sport])
        format.html { redirect_to(@profile_play_sport, :notice => 'Profile play sport was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_play_sport.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_play_sports/1
  # DELETE /profile_play_sports/1.xml
  def destroy
    @profile_play_sport = ProfilePlaySport.find(params[:id])
    @profile_play_sport.destroy

    respond_to do |format|
      format.html { redirect_to(profile_play_sports_url) }
      format.xml  { head :ok }
    end
  end
end
