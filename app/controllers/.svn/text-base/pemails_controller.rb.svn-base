class PemailsController < ApplicationController
  # GET /pemails
  # GET /pemails.xml
  def index
    @pemails = Pemail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pemails }
    end
  end

  # GET /pemails/1
  # GET /pemails/1.xml
  def show
    @pemail = Pemail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pemail }
    end
  end

  # GET /pemails/new
  # GET /pemails/new.xml
  def new
    @pemail = Pemail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pemail }
    end
  end

  # GET /pemails/1/edit
  def edit
    @pemail = Pemail.find(params[:id])
  end

  # POST /pemails
  # POST /pemails.xml
  def create
    @pemail = Pemail.new(params[:pemail])

    respond_to do |format|
      if @pemail.save
        format.html { redirect_to(@pemail, :notice => 'Pemail was successfully created.') }
        format.xml  { render :xml => @pemail, :status => :created, :location => @pemail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pemail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pemails/1
  # PUT /pemails/1.xml
  def update
    @pemail = Pemail.find(params[:id])

    respond_to do |format|
      if @pemail.update_attributes(params[:pemail])
        format.html { redirect_to(@pemail, :notice => 'Pemail was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pemail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pemails/1
  # DELETE /pemails/1.xml
  def destroy
    @pemail = Pemail.find(params[:id])
    @pemail.destroy

    respond_to do |format|
      format.html { redirect_to(pemails_url) }
      format.xml  { head :ok }
    end
  end
end
