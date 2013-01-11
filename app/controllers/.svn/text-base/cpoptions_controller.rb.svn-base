class CpoptionsController < ApplicationController
  # GET /cpoptions
  # GET /cpoptions.xml
  def index
    @cpoptions = Cpoption.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cpoptions }
    end
  end

  # GET /cpoptions/1
  # GET /cpoptions/1.xml
  def show
    @cpoption = Cpoption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cpoption }
    end
  end

  # GET /cpoptions/new
  # GET /cpoptions/new.xml
  def new
    @cpoption = Cpoption.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cpoption }
    end
  end

  # GET /cpoptions/1/edit
  def edit
    @cpoption = Cpoption.find(params[:id])
  end

  # POST /cpoptions
  # POST /cpoptions.xml
  def create
    @cpoption = Cpoption.new(params[:cpoption])

    respond_to do |format|
      if @cpoption.save
        format.html { redirect_to(@cpoption, :notice => 'Cpoption was successfully created.') }
        format.xml  { render :xml => @cpoption, :status => :created, :location => @cpoption }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cpoption.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cpoptions/1
  # PUT /cpoptions/1.xml
  def update
    @cpoption = Cpoption.find(params[:id])

    respond_to do |format|
      if @cpoption.update_attributes(params[:cpoption])
        format.html { redirect_to(@cpoption, :notice => 'Cpoption was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cpoption.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cpoptions/1
  # DELETE /cpoptions/1.xml
  def destroy
    @cpoption = Cpoption.find(params[:id])
    @cpoption.destroy

    respond_to do |format|
      format.html { redirect_to(cpoptions_url) }
      format.xml  { head :ok }
    end
  end
end
