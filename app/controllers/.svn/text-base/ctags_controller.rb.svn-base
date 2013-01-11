class CtagsController < ApplicationController

  # GET /ctags
  # GET /ctags.xml
  def index
    @ctags = Ctag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ctags }
    end
  end

  # GET /ctags/1
  # GET /ctags/1.xml
  def show
    @ctag = Ctag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ctag }
    end
  end

  # GET /ctags/new
  # GET /ctags/new.xml
  def new
    @ctag = Ctag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ctag }
    end
  end

  # GET /ctags/1/edit
  def edit
    @ctag = Ctag.find(params[:id])
  end

  # POST /ctags
  # POST /ctags.xml
  def create
    @ctag = Ctag.new(params[:ctag])

    respond_to do |format|
      if @ctag.save
        format.html { redirect_to(@ctag, :notice => 'Ctag was successfully created.') }
        format.xml  { render :xml => @ctag, :status => :created, :location => @ctag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ctag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ctags/1
  # PUT /ctags/1.xml
  def update
    @ctag = Ctag.find(params[:id])

    respond_to do |format|
      if @ctag.update_attributes(params[:ctag])
        format.html { redirect_to(@ctag, :notice => 'Ctag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ctag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ctags/1
  # DELETE /ctags/1.xml
  def destroy
    @ctag = Ctag.find(params[:id])
    @ctag.destroy

    respond_to do |format|
      format.html { redirect_to(ctags_url) }
      format.xml  { head :ok }
    end
  end
end
