class ProfileMusicsController < ApplicationController
  # GET /profile_musics
  # GET /profile_musics.xml
  def index
    @profile_musics = ProfileMusic.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_musics }
    end
  end

  # GET /profile_musics/1
  # GET /profile_musics/1.xml
  def show
    @profile_music = ProfileMusic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_music }
    end
  end

  # GET /profile_musics/new
  # GET /profile_musics/new.xml
  def new
    @profile_music = ProfileMusic.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_music }
    end
  end

  # GET /profile_musics/1/edit
  def edit
    @profile_music = ProfileMusic.find(params[:id])
  end

  # POST /profile_musics
  # POST /profile_musics.xml
  def create
    @profile_music = ProfileMusic.new(params[:profile_music])

    respond_to do |format|
      if @profile_music.save
        format.html { redirect_to(@profile_music, :notice => 'Profile music was successfully created.') }
        format.xml  { render :xml => @profile_music, :status => :created, :location => @profile_music }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_music.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_musics/1
  # PUT /profile_musics/1.xml
  def update
    @profile_music = ProfileMusic.find(params[:id])

    respond_to do |format|
      if @profile_music.update_attributes(params[:profile_music])
        format.html { redirect_to(@profile_music, :notice => 'Profile music was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_music.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_musics/1
  # DELETE /profile_musics/1.xml
  def destroy
    @profile_music = ProfileMusic.find(params[:id])
    @profile_music.destroy

    respond_to do |format|
      format.html { redirect_to(profile_musics_url) }
      format.xml  { head :ok }
    end
  end
end
