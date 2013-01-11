class PneighboursController < ApplicationController
  # GET /pneighbours
  # GET /pneighbours.xml
  def index
    @pneighbours = Pneighbour.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pneighbours }
    end
  end

  # GET /pneighbours/1
  # GET /pneighbours/1.xml
  def show
    @pneighbour = Pneighbour.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pneighbour }
    end
  end

  # GET /pneighbours/new
  # GET /pneighbours/new.xml
  def new
    @pneighbour = Pneighbour.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pneighbour }
    end
  end

  # GET /pneighbours/1/edit
  def edit
    @pneighbour = Pneighbour.find(params[:id])
  end

  # POST /pneighbours
  # POST /pneighbours.xml
  def create
    @pneighbour = Pneighbour.new(params[:pneighbour])

    respond_to do |format|
      if @pneighbour.save
        format.html { redirect_to(@pneighbour, :notice => 'Pneighbour was successfully created.') }
        format.xml  { render :xml => @pneighbour, :status => :created, :location => @pneighbour }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pneighbour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pneighbours/1
  # PUT /pneighbours/1.xml
  def update
    @pneighbour = Pneighbour.find(params[:id])

    respond_to do |format|
      if @pneighbour.update_attributes(params[:pneighbour])
        format.html { redirect_to(@pneighbour, :notice => 'Pneighbour was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pneighbour.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pneighbours/1
  # DELETE /pneighbours/1.xml
  def destroy
    @pneighbour = Pneighbour.find(params[:id])
    @pneighbour.destroy

    respond_to do |format|
      format.html { redirect_to(pneighbours_url) }
      format.xml  { head :ok }
    end
  end
end
