class PphonesController < ApplicationController
  # GET /pphones
  # GET /pphones.xml
  def index
    @pphones = Pphone.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pphones }
    end
  end

  # GET /pphones/1
  # GET /pphones/1.xml
  def show
    @pphone = Pphone.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pphone }
    end
  end

  # GET /pphones/new
  # GET /pphones/new.xml
  def new
    @pphone = Pphone.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pphone }
    end
  end

  # GET /pphones/1/edit
  def edit
    @pphone = Pphone.find(params[:id])
  end

  # POST /pphones
  # POST /pphones.xml
  def create
    @pphone = Pphone.new(params[:pphone])

    respond_to do |format|
      if @pphone.save
        format.html { redirect_to(@pphone, :notice => 'Pphone was successfully created.') }
        format.xml  { render :xml => @pphone, :status => :created, :location => @pphone }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pphone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pphones/1
  # PUT /pphones/1.xml
  def update
    @pphone = Pphone.find(params[:id])

    respond_to do |format|
      if @pphone.update_attributes(params[:pphone])
        format.html { redirect_to(@pphone, :notice => 'Pphone was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pphone.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pphones/1
  # DELETE /pphones/1.xml
  def destroy
    @pphone = Pphone.find(params[:id])
    @pphone.destroy

    respond_to do |format|
      format.html { redirect_to(pphones_url) }
      format.xml  { head :ok }
    end
  end
end
