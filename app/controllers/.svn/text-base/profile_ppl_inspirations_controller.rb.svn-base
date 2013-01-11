class ProfilePplInspirationsController < ApplicationController
  # GET /profile_ppl_inspirations
  # GET /profile_ppl_inspirations.xml
  def index
    @profile_ppl_inspirations = ProfilePplInspiration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_ppl_inspirations }
    end
  end

  # GET /profile_ppl_inspirations/1
  # GET /profile_ppl_inspirations/1.xml
  def show
    @profile_ppl_inspiration = ProfilePplInspiration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_ppl_inspiration }
    end
  end

  # GET /profile_ppl_inspirations/new
  # GET /profile_ppl_inspirations/new.xml
  def new
    @profile_ppl_inspiration = ProfilePplInspiration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_ppl_inspiration }
    end
  end

  # GET /profile_ppl_inspirations/1/edit
  def edit
    @profile_ppl_inspiration = ProfilePplInspiration.find(params[:id])
  end

  # POST /profile_ppl_inspirations
  # POST /profile_ppl_inspirations.xml
  def create
    @profile_ppl_inspiration = ProfilePplInspiration.new(params[:profile_ppl_inspiration])

    respond_to do |format|
      if @profile_ppl_inspiration.save
        format.html { redirect_to(@profile_ppl_inspiration, :notice => 'Profile ppl inspiration was successfully created.') }
        format.xml  { render :xml => @profile_ppl_inspiration, :status => :created, :location => @profile_ppl_inspiration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_ppl_inspiration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_ppl_inspirations/1
  # PUT /profile_ppl_inspirations/1.xml
  def update
    @profile_ppl_inspiration = ProfilePplInspiration.find(params[:id])

    respond_to do |format|
      if @profile_ppl_inspiration.update_attributes(params[:profile_ppl_inspiration])
        format.html { redirect_to(@profile_ppl_inspiration, :notice => 'Profile ppl inspiration was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_ppl_inspiration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_ppl_inspirations/1
  # DELETE /profile_ppl_inspirations/1.xml
  def destroy
    @profile_ppl_inspiration = ProfilePplInspiration.find(params[:id])
    @profile_ppl_inspiration.destroy

    respond_to do |format|
      format.html { redirect_to(profile_ppl_inspirations_url) }
      format.xml  { head :ok }
    end
  end
end
