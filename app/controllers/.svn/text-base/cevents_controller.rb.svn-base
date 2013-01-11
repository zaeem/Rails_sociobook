class CeventsController < ApplicationController
  # GET /cevents
  # GET /cevents.xml
  def index
    @cevents = Cevent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cevents }
    end
  end

  # GET /cevents/1
  # GET /cevents/1.xml
  def show
    @cevent = Cevent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cevent }
    end
  end

  # GET /cevents/new
  # GET /cevents/new.xml
  def new
    @cevent = Cevent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cevent }
    end
  end

  # GET /cevents/1/edit
  def edit
    @cevent = Cevent.find(params[:id])
  end

  # POST /cevents
  # POST /cevents.xml
  def create
    @cevent = Cevent.new(params[:cevent])

    respond_to do |format|
      if @cevent.save
        format.html { redirect_to(@cevent, :notice => 'Cevent was successfully created.') }
        format.xml  { render :xml => @cevent, :status => :created, :location => @cevent }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cevent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cevents/1
  # PUT /cevents/1.xml
  def update
    @cevent = Cevent.find(params[:id])

    respond_to do |format|
      if @cevent.update_attributes(params[:cevent])
        format.html { redirect_to(@cevent, :notice => 'Cevent was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cevent.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cevents/1
  # DELETE /cevents/1.xml
  def destroy
    @cevent = Cevent.find(params[:id])
    @cevent.destroy

    respond_to do |format|
      format.html { redirect_to(cevents_url) }
      format.xml  { head :ok }
    end
  end
end
