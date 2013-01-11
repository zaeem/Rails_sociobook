class CstatusesController < ApplicationController
  # GET /cstatuses
  # GET /cstatuses.xml
  def index
    @cstatuses = Cstatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cstatuses }
    end
  end

  # GET /cstatuses/1
  # GET /cstatuses/1.xml
  def show
    @cstatus = Cstatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cstatus }
    end
  end

  # GET /cstatuses/new
  # GET /cstatuses/new.xml
  def new
    @cstatus = Cstatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cstatus }
    end
  end

  # GET /cstatuses/1/edit
  def edit
    @cstatus = Cstatus.find(params[:id])
  end

  # POST /cstatuses
  # POST /cstatuses.xml
  def create
    @cstatus = Cstatus.new(params[:cstatus])
    respond_to do |format|
      if @cstatus.save
        format.html { redirect_to(@cstatus, :notice => 'Cstatus was successfully created.') }
        format.xml  { render :xml => @cstatus, :status => :created, :location => @cstatus }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cstatus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cstatuses/1
  # PUT /cstatuses/1.xml
  def update
    @cstatus = Cstatus.find(params[:id])

    respond_to do |format|
      if @cstatus.update_attributes(params[:cstatus])
        format.html { redirect_to(@cstatus, :notice => 'Cstatus was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cstatus.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cstatuses/1
  # DELETE /cstatuses/1.xml
  def destroy
    @cstatus = Cstatus.find(params[:id])
    @cstatus.destroy

    respond_to do |format|
      format.html { redirect_to(cstatuses_url) }
      format.xml  { head :ok }
    end
  end
end
