class ProfileInterestsController < ApplicationController
  # GET /profile_interests
  # GET /profile_interests.xml
  def index
    @profile_interests = ProfileInterest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_interests }
    end
  end

  # GET /profile_interests/1
  # GET /profile_interests/1.xml
  def show
    @profile_interest = ProfileInterest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_interest }
    end
  end

  # GET /profile_interests/new
  # GET /profile_interests/new.xml
  def new
    @profile_interest = ProfileInterest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_interest }
    end
  end

  # GET /profile_interests/1/edit
  def edit
    @profile_interest = ProfileInterest.find(params[:id])
  end

  # POST /profile_interests
  # POST /profile_interests.xml
  def create
    @profile_interest = ProfileInterest.new(params[:profile_interest])

    respond_to do |format|
      if @profile_interest.save
        format.html { redirect_to(@profile_interest, :notice => 'Profile interest was successfully created.') }
        format.xml  { render :xml => @profile_interest, :status => :created, :location => @profile_interest }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_interest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_interests/1
  # PUT /profile_interests/1.xml
  def update
    @profile_interest = ProfileInterest.find(params[:id])

    respond_to do |format|
      if @profile_interest.update_attributes(params[:profile_interest])
        format.html { redirect_to(@profile_interest, :notice => 'Profile interest was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_interest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_interests/1
  # DELETE /profile_interests/1.xml
  def destroy
    @profile_interest = ProfileInterest.find(params[:id])
    @profile_interest.destroy

    respond_to do |format|
      format.html { redirect_to(profile_interests_url) }
      format.xml  { head :ok }
    end
  end
end
