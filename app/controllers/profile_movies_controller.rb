class ProfileMoviesController < ApplicationController
  # GET /profile_movies
  # GET /profile_movies.xml
  def index
    @profile_movies = ProfileMovie.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_movies }
    end
  end

  # GET /profile_movies/1
  # GET /profile_movies/1.xml
  def show
    @profile_movie = ProfileMovie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_movie }
    end
  end

  # GET /profile_movies/new
  # GET /profile_movies/new.xml
  def new
    @profile_movie = ProfileMovie.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_movie }
    end
  end

  # GET /profile_movies/1/edit
  def edit
    @profile_movie = ProfileMovie.find(params[:id])
  end

  # POST /profile_movies
  # POST /profile_movies.xml
  def create
    @profile_movie = ProfileMovie.new(params[:profile_movie])

    respond_to do |format|
      if @profile_movie.save
        format.html { redirect_to(@profile_movie, :notice => 'Profile movie was successfully created.') }
        format.xml  { render :xml => @profile_movie, :status => :created, :location => @profile_movie }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_movie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_movies/1
  # PUT /profile_movies/1.xml
  def update
    @profile_movie = ProfileMovie.find(params[:id])

    respond_to do |format|
      if @profile_movie.update_attributes(params[:profile_movie])
        format.html { redirect_to(@profile_movie, :notice => 'Profile movie was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_movie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_movies/1
  # DELETE /profile_movies/1.xml
  def destroy
    @profile_movie = ProfileMovie.find(params[:id])
    @profile_movie.destroy

    respond_to do |format|
      format.html { redirect_to(profile_movies_url) }
      format.xml  { head :ok }
    end
  end
end
