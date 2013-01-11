class ProfileUniversitiesController < ApplicationController
  # GET /profile_universities
  # GET /profile_universities.xml
  def index
    @profile_universities = ProfileUniversity.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_universities }
    end
  end

  # GET /profile_universities/1
  # GET /profile_universities/1.xml
  def show
    @profile_university = ProfileUniversity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_university }
    end
  end

  # GET /profile_universities/new
  # GET /profile_universities/new.xml
  def new
    @profile_university = ProfileUniversity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_university }
    end
  end

  # GET /profile_universities/1/edit
  def edit
    @profile_university = ProfileUniversity.find(params[:id])
  end

  # POST /profile_universities
  # POST /profile_universities.xml
  def create
    @profile_university = ProfileUniversity.new(params[:profile_university])

    respond_to do |format|
      if @profile_university.save
        format.html { redirect_to(@profile_university, :notice => 'Profile university was successfully created.') }
        format.xml  { render :xml => @profile_university, :status => :created, :location => @profile_university }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_university.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_universities/1
  # PUT /profile_universities/1.xml
  def update
    @profile_university = ProfileUniversity.find(params[:id])

    respond_to do |format|
      if @profile_university.update_attributes(params[:profile_university])
        format.html { redirect_to(@profile_university, :notice => 'Profile university was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_university.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_universities/1
  # DELETE /profile_universities/1.xml
  def destroy
    @profile_university = ProfileUniversity.find(params[:id])
    @profile_university.destroy

    respond_to do |format|
      format.html { redirect_to(profile_universities_url) }
      format.xml  { head :ok }
    end
  end
end
