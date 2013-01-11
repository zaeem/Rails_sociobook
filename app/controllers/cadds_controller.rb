class CaddsController < ApplicationController
  # GET /cadds
  # GET /cadds.xml
  def index
    @cadds = Cadd.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cadds }
    end
  end

  # GET /cadds/1
  # GET /cadds/1.xml
  def show
    @cadd = Cadd.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cadd }
    end
  end

  # GET /cadds/new
  # GET /cadds/new.xml
  def new
    @cadd = Cadd.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cadd }
    end
  end

  # GET /cadds/1/edit
  def edit
    @cadd = Cadd.find(params[:id])
  end

  # POST /cadds
  # POST /cadds.xml
  def create
    @cadd = Cadd.new(params[:cadd])

    respond_to do |format|
      if @cadd.save
        format.html { redirect_to(@cadd, :notice => 'Cadd was successfully created.') }
        format.xml  { render :xml => @cadd, :status => :created, :location => @cadd }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cadd.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cadds/1
  # PUT /cadds/1.xml
  def update
    @cadd = Cadd.find(params[:id])

    respond_to do |format|
      if @cadd.update_attributes(params[:cadd])
        format.html { redirect_to(@cadd, :notice => 'Cadd was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cadd.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cadds/1
  # DELETE /cadds/1.xml
  def destroy
    @cadd = Cadd.find(params[:id])
    @cadd.destroy

    respond_to do |format|
      format.html { redirect_to(cadds_url) }
      format.xml  { head :ok }
    end
  end
end
