class ProfileEmployerProjectsController < ApplicationController
  # GET /profile_employer_projects
  # GET /profile_employer_projects.xml
  def index
    @profile_employer_projects = ProfileEmployerProject.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_employer_projects }
    end
  end

  # GET /profile_employer_projects/1
  # GET /profile_employer_projects/1.xml
  def show
    @profile_employer_project = ProfileEmployerProject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_employer_project }
    end
  end

  # GET /profile_employer_projects/new
  # GET /profile_employer_projects/new.xml
  def new
    @profile_employer_project = ProfileEmployerProject.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_employer_project }
    end
  end

  # GET /profile_employer_projects/1/edit
  def edit
    @profile_employer_project = ProfileEmployerProject.find(params[:id])
  end

  # POST /profile_employer_projects
  # POST /profile_employer_projects.xml
  def create
    @profile_employer_project = ProfileEmployerProject.new(params[:profile_employer_project])

    respond_to do |format|
      if @profile_employer_project.save
        format.html { redirect_to(@profile_employer_project, :notice => 'Profile employer project was successfully created.') }
        format.xml  { render :xml => @profile_employer_project, :status => :created, :location => @profile_employer_project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_employer_project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_employer_projects/1
  # PUT /profile_employer_projects/1.xml
  def update
    @profile_employer_project = ProfileEmployerProject.find(params[:id])

    respond_to do |format|
      if @profile_employer_project.update_attributes(params[:profile_employer_project])
        format.html { redirect_to(@profile_employer_project, :notice => 'Profile employer project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_employer_project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_employer_projects/1
  # DELETE /profile_employer_projects/1.xml
  def destroy
    @profile_employer_project = ProfileEmployerProject.find(params[:id])
    @profile_employer_project.destroy

    respond_to do |format|
      format.html { redirect_to(profile_employer_projects_url) }
      format.xml  { head :ok }
    end
  end
end
