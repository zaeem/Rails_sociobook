class PwebsitesController < ApplicationController
  # GET /pwebsites
  # GET /pwebsites.xml
  def index
    @pwebsites = Pwebsite.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pwebsites }
    end
  end

  # GET /pwebsites/1
  # GET /pwebsites/1.xml
  def show
    @pwebsite = Pwebsite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pwebsite }
    end
  end

  # GET /pwebsites/new
  # GET /pwebsites/new.xml
  def new
    @pwebsite = Pwebsite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pwebsite }
    end
  end

  # GET /pwebsites/1/edit
  def edit
    @pwebsite = Pwebsite.find(params[:id])
  end

  # POST /pwebsites
  # POST /pwebsites.xml
  def create
    @pwebsite = Pwebsite.new(params[:pwebsite])

    respond_to do |format|
      if @pwebsite.save
        format.html { redirect_to(@pwebsite, :notice => 'Pwebsite was successfully created.') }
        format.xml  { render :xml => @pwebsite, :status => :created, :location => @pwebsite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pwebsite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pwebsites/1
  # PUT /pwebsites/1.xml
  def update
    @pwebsite = Pwebsite.find(params[:id])

    respond_to do |format|
      if @pwebsite.update_attributes(params[:pwebsite])
        format.html { redirect_to(@pwebsite, :notice => 'Pwebsite was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pwebsite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pwebsites/1
  # DELETE /pwebsites/1.xml
  def destroy
    @pwebsite = Pwebsite.find(params[:id])
    @pwebsite.destroy

    respond_to do |format|
      format.html { redirect_to(pwebsites_url) }
      format.xml  { head :ok }
    end
  end
end
