class CsharedwithsController < ApplicationController
  # GET /csharedwiths
  # GET /csharedwiths.xml
  def index
    @csharedwiths = Csharedwith.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @csharedwiths }
    end
  end

  # GET /csharedwiths/1
  # GET /csharedwiths/1.xml
  def show
    @csharedwith = Csharedwith.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @csharedwith }
    end
  end

  # GET /csharedwiths/new
  # GET /csharedwiths/new.xml
  def new
    @csharedwith = Csharedwith.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @csharedwith }
    end
  end

  # GET /csharedwiths/1/edit
  def edit
    @csharedwith = Csharedwith.find(params[:id])
  end

  # POST /csharedwiths
  # POST /csharedwiths.xml
  def create
    @csharedwith = Csharedwith.new(params[:csharedwith])

    respond_to do |format|
      if @csharedwith.save
        format.html { redirect_to(@csharedwith, :notice => 'Csharedwith was successfully created.') }
        format.xml  { render :xml => @csharedwith, :status => :created, :location => @csharedwith }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @csharedwith.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /csharedwiths/1
  # PUT /csharedwiths/1.xml
  def update
    @csharedwith = Csharedwith.find(params[:id])

    respond_to do |format|
      if @csharedwith.update_attributes(params[:csharedwith])
        format.html { redirect_to(@csharedwith, :notice => 'Csharedwith was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @csharedwith.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /csharedwiths/1
  # DELETE /csharedwiths/1.xml
  def destroy
    @csharedwith = Csharedwith.find(params[:id])
    @csharedwith.destroy

    respond_to do |format|
      format.html { redirect_to(csharedwiths_url) }
      format.xml  { head :ok }
    end
  end
end
