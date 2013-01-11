class ProfileGamesController < ApplicationController
  # GET /profile_games
  # GET /profile_games.xml
  def index
    @profile_games = ProfileGame.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_games }
    end
  end

  # GET /profile_games/1
  # GET /profile_games/1.xml
  def show
    @profile_game = ProfileGame.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_game }
    end
  end

  # GET /profile_games/new
  # GET /profile_games/new.xml
  def new
    @profile_game = ProfileGame.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_game }
    end
  end

  # GET /profile_games/1/edit
  def edit
    @profile_game = ProfileGame.find(params[:id])
  end

  # POST /profile_games
  # POST /profile_games.xml
  def create
    @profile_game = ProfileGame.new(params[:profile_game])

    respond_to do |format|
      if @profile_game.save
        format.html { redirect_to(@profile_game, :notice => 'Profile game was successfully created.') }
        format.xml  { render :xml => @profile_game, :status => :created, :location => @profile_game }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_games/1
  # PUT /profile_games/1.xml
  def update
    @profile_game = ProfileGame.find(params[:id])

    respond_to do |format|
      if @profile_game.update_attributes(params[:profile_game])
        format.html { redirect_to(@profile_game, :notice => 'Profile game was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_game.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_games/1
  # DELETE /profile_games/1.xml
  def destroy
    @profile_game = ProfileGame.find(params[:id])
    @profile_game.destroy

    respond_to do |format|
      format.html { redirect_to(profile_games_url) }
      format.xml  { head :ok }
    end
  end
end
