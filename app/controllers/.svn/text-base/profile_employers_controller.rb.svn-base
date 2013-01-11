class ProfileEmployersController < ApplicationController
  # GET /profile_employers
  # GET /profile_employers.xml
  def index
    @profile_employers = ProfileEmployer.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_employers }
    end
  end

  # GET /profile_employers/1
  # GET /profile_employers/1.xml
  def show
    @profile_employer = ProfileEmployer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_employer }
    end
  end

  # GET /profile_employers/new
  # GET /profile_employers/new.xml
  def new
    @profile_employer = ProfileEmployer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_employer }
    end
  end

  # GET /profile_employers/1/edit
  def edit
    @profile_employer = ProfileEmployer.find(params[:id])
  end

  # POST /profile_employers
  # POST /profile_employers.xml
  def create
    @profile_employer = ProfileEmployer.new(params[:profile_employer])

    respond_to do |format|
      if @profile_employer.save
        format.html { redirect_to(@profile_employer, :notice => 'Profile employer was successfully created.') }
        format.xml  { render :xml => @profile_employer, :status => :created, :location => @profile_employer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_employer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_employers/1
  # PUT /profile_employers/1.xml
  def update
    @profile_employer = ProfileEmployer.find(params[:id])

    respond_to do |format|
      if @profile_employer.update_attributes(params[:profile_employer])
        format.html { redirect_to(@profile_employer, :notice => 'Profile employer was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_employer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_employers/1
  # DELETE /profile_employers/1.xml
  def destroy
    @profile_employer = ProfileEmployer.find(params[:id])
    @profile_employer.destroy

    respond_to do |format|
      format.html { redirect_to(profile_employers_url) }
      format.xml  { head :ok }
    end
  end
end
