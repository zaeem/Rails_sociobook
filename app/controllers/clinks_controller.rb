class ClinksController < ApplicationController
  # GET /clinks
  # GET /clinks.xml
  def index
    @clinks = Clink.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clinks }
    end
  end

  # GET /clinks/1
  # GET /clinks/1.xml
  def show
    @clink = Clink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @clink }
    end
  end

  # GET /clinks/new
  # GET /clinks/new.xml
  def new
    @clink = Clink.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @clink }
    end
  end

  # GET /clinks/1/edit
  def edit
    @clink = Clink.find(params[:id])
  end

  # POST /clinks
  # POST /clinks.xml
  def create
    @clink = Clink.new(params[:clink])

    respond_to do |format|
      if @clink.save
        format.html { redirect_to(@clink, :notice => 'Clink was successfully created.') }
        format.xml  { render :xml => @clink, :status => :created, :location => @clink }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @clink.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clinks/1
  # PUT /clinks/1.xml
  def update
    @clink = Clink.find(params[:id])

    respond_to do |format|
      if @clink.update_attributes(params[:clink])
        format.html { redirect_to(@clink, :notice => 'Clink was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @clink.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clinks/1
  # DELETE /clinks/1.xml
  def destroy
    @clink = Clink.find(params[:id])
    @clink.destroy

    respond_to do |format|
      format.html { redirect_to(clinks_url) }
      format.xml  { head :ok }
    end
  end
end
