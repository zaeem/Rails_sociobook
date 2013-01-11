class CpsharesController < ApplicationController
  # GET /cpshares
  # GET /cpshares.xml
  def index
    @cpshares = Cpshare.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cpshares }
    end
  end

  # GET /cpshares/1
  # GET /cpshares/1.xml
  def show
    @cpshare = Cpshare.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cpshare }
    end
  end

  # GET /cpshares/new
  # GET /cpshares/new.xml
  def new
    @cpshare = Cpshare.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cpshare }
    end
  end

  # GET /cpshares/1/edit
  def edit
    @cpshare = Cpshare.find(params[:id])
  end

  # POST /cpshares
  # POST /cpshares.xml
  def create
    @cpshare = Cpshare.new(params[:cpshare])

    respond_to do |format|
      if @cpshare.save
        format.html { redirect_to(@cpshare, :notice => 'Cpshare was successfully created.') }
        format.xml  { render :xml => @cpshare, :status => :created, :location => @cpshare }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cpshare.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cpshares/1
  # PUT /cpshares/1.xml
  def update
    @cpshare = Cpshare.find(params[:id])

    respond_to do |format|
      if @cpshare.update_attributes(params[:cpshare])
        format.html { redirect_to(@cpshare, :notice => 'Cpshare was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cpshare.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cpshares/1
  # DELETE /cpshares/1.xml
  def destroy
    @cpshare = Cpshare.find(params[:id])
    @cpshare.destroy

    respond_to do |format|
      format.html { redirect_to(cpshares_url) }
      format.xml  { head :ok }
    end
  end
end
