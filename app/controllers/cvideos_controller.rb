class CvideosController < ApplicationController
  # GET /cvideos
  # GET /cvideos.xml
  def index
    @cvideos = Cvideo.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cvideos }
    end
  end

  
  # GET /cvideos/1
  # GET /cvideos/1.xml
  def show
   # return redirect_to vvideo_contents_path

    @cvideo = Cvideo.find(params[:id])

   # return redirect_to vvideo_contents_path
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cvideo }
    end
  end

  # GET /cvideos/new
  # GET /cvideos/new.xml
  def new
    @cvideo = Cvideo.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cvideo }
    end
  end

  # GET /cvideos/1/edit
  def edit
    @cvideo = Cvideo.find(params[:id])
  end

  # POST /cvideos
  # POST /cvideos.xml
  def create
     @cvideo = Cvideo.new(params[:cvideo])
    respond_to do |format|
      
      puts "============================"
      if @cvideo.save
#        @cvideo.convert
#        @vi = Cvideo.find(@cvideo.id)
#   
        format.html { redirect_to(@cvideo, :notice => 'Cvideo was successfully created.') }
        format.xml  { render :xml => @cvideo, :status => :created, :location => @cvideo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cvideo.errors, :status => :unprocessable_entity }
      end
      
    #  return redirect_to vvideo_contents_path
    end
  end

  # PUT /cvideos/1
  # PUT /cvideos/1.xml
  def update
    @cvideo = Cvideo.find(params[:id])

    respond_to do |format|
      if @cvideo.update_attributes(params[:cvideo])
        format.html { redirect_to(@cvideo, :notice => 'Cvideo was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cvideo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cvideos/1
  # DELETE /cvideos/1.xml
  def destroy
    @cvideo = Cvideo.find(params[:id])
    @cvideo.destroy

    respond_to do |format|
      format.html { redirect_to(cvideos_url) }
      format.xml  { head :ok }
    end
  end
end
