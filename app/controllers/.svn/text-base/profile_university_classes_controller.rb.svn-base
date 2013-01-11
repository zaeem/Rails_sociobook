class ProfileUniversityClassesController < ApplicationController
  # GET /profile_university_classes
  # GET /profile_university_classes.xml
  def index
    @profile_university_classes = ProfileUniversityClass.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_university_classes }
    end
  end

  # GET /profile_university_classes/1
  # GET /profile_university_classes/1.xml
  def show
    @profile_university_class = ProfileUniversityClass.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_university_class }
    end
  end

  # GET /profile_university_classes/new
  # GET /profile_university_classes/new.xml
  def new
    @profile_university_class = ProfileUniversityClass.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_university_class }
    end
  end

  # GET /profile_university_classes/1/edit
  def edit
    @profile_university_class = ProfileUniversityClass.find(params[:id])
  end

  # POST /profile_university_classes
  # POST /profile_university_classes.xml
  def create
    @profile_university_class = ProfileUniversityClass.new(params[:profile_university_class])

    respond_to do |format|
      if @profile_university_class.save
        format.html { redirect_to(@profile_university_class, :notice => 'Profile university class was successfully created.') }
        format.xml  { render :xml => @profile_university_class, :status => :created, :location => @profile_university_class }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_university_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_university_classes/1
  # PUT /profile_university_classes/1.xml
  def update
    @profile_university_class = ProfileUniversityClass.find(params[:id])

    respond_to do |format|
      if @profile_university_class.update_attributes(params[:profile_university_class])
        format.html { redirect_to(@profile_university_class, :notice => 'Profile university class was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_university_class.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_university_classes/1
  # DELETE /profile_university_classes/1.xml
  def destroy
    @profile_university_class = ProfileUniversityClass.find(params[:id])
    @profile_university_class.destroy

    respond_to do |format|
      format.html { redirect_to(profile_university_classes_url) }
      format.xml  { head :ok }
    end
  end
end
