class CphotosController < ApplicationController
  # GET /cphotos
  # GET /cphotos.xml
  def index
    @cphotos = Cphoto.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cphotos }
    end
  end

  # GET /cphotos/1
  # GET /cphotos/1.xml
  def show
    @cphoto = Cphoto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cphoto }
    end
  end

  # GET /cphotos/new
  # GET /cphotos/new.xml
  def new
    @cphoto = Cphoto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cphoto }
    end
  end

  # GET /cphotos/1/edit
  def edit
    @cphoto = Cphoto.find(params[:id])
  end

  # POST /cphotos
  # POST /cphotos.xml
  def create
    @cphoto = Cphoto.new(params[:cphoto])

    respond_to do |format|
      if @cphoto.save
        format.html { redirect_to(@cphoto, :notice => 'Cphoto was successfully created.') }
        format.xml  { render :xml => @cphoto, :status => :created, :location => @cphoto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cphoto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cphotos/1
  # PUT /cphotos/1.xml
  def update
    @cphoto = Cphoto.find(params[:id])

    respond_to do |format|
      if @cphoto.update_attributes(params[:cphoto])
        if params[:from] == "edit_photo"
           format.html { redirect_to("#{ valbum_contents_path()}?#{params[:return_address]}", :notice => 'Photo was successfully updated.') }  
        else
          format.html { redirect_to(@cphoto, :notice => 'photo was successfully updated.') }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cphoto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cphotos/1
  # DELETE /cphotos/1.xml
  def destroy
    @cphoto = Cphoto.find(params[:id])
    @cphoto.destroy

#    respond_to do |format|
#      format.html { redirect_to(cphotos_url) }
#      format.xml  { head :ok }
#    end
  end
end
