class PscreensController < ApplicationController
  # GET /pscreens
  # GET /pscreens.xml
  def index
    @pscreens = Pscreen.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pscreens }
    end
  end

  # GET /pscreens/1
  # GET /pscreens/1.xml
  def show
    @pscreen = Pscreen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pscreen }
    end
  end

  # GET /pscreens/new
  # GET /pscreens/new.xml
  def new
    @pscreen = Pscreen.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pscreen }
    end
  end

  # GET /pscreens/1/edit
  def edit
    @pscreen = Pscreen.find(params[:id])
  end

  # POST /pscreens
  # POST /pscreens.xml
  def create
    @pscreen = Pscreen.new(params[:pscreen])

    respond_to do |format|
      if @pscreen.save
        format.html { redirect_to(@pscreen, :notice => 'Pscreen was successfully created.') }
        format.xml  { render :xml => @pscreen, :status => :created, :location => @pscreen }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pscreen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pscreens/1
  # PUT /pscreens/1.xml
  def update
    @pscreen = Pscreen.find(params[:id])

    respond_to do |format|
      if @pscreen.update_attributes(params[:pscreen])
        format.html { redirect_to(@pscreen, :notice => 'Pscreen was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pscreen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pscreens/1
  # DELETE /pscreens/1.xml
  def destroy
    @pscreen = Pscreen.find(params[:id])
    @pscreen.destroy

    respond_to do |format|
      format.html { redirect_to(pscreens_url) }
      format.xml  { head :ok }
    end
  end
end
