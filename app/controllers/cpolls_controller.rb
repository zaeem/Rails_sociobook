class CpollsController < ApplicationController
  # GET /cpolls
  # GET /cpolls.xml
  def index
    @cpolls = Cpoll.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cpolls }
    end
  end

  # GET /cpolls/1
  # GET /cpolls/1.xml
  def show
    @cpoll = Cpoll.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cpoll }
    end
  end

  # GET /cpolls/new
  # GET /cpolls/new.xml
  def new
    @cpoll = Cpoll.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cpoll }
    end
  end

  # GET /cpolls/1/edit
  def edit
    @cpoll = Cpoll.find(params[:id])
  end

  # POST /cpolls
  # POST /cpolls.xml
  def create
    @cpoll = Cpoll.new(params[:cpoll])

    respond_to do |format|
      if @cpoll.save
        format.html { redirect_to(@cpoll, :notice => 'Cpoll was successfully created.') }
        format.xml  { render :xml => @cpoll, :status => :created, :location => @cpoll }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cpoll.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cpolls/1
  # PUT /cpolls/1.xml
  def update
    @cpoll = Cpoll.find(params[:id])

    respond_to do |format|
      if @cpoll.update_attributes(params[:cpoll])
        format.html { redirect_to(@cpoll, :notice => 'Cpoll was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cpoll.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cpolls/1
  # DELETE /cpolls/1.xml
  def destroy
    @cpoll = Cpoll.find(params[:id])
    @cpoll.destroy

    respond_to do |format|
      format.html { redirect_to(cpolls_url) }
      format.xml  { head :ok }
    end
  end
end
