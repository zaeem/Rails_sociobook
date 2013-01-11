class CcommentsController < ApplicationController
  # GET /ccomments
  # GET /ccomments.xml
  def index
    @ccomments = Ccomment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ccomments }
    end
  end

  # GET /ccomments/1
  # GET /ccomments/1.xml
  def show
    @ccomment = Ccomment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ccomment }
    end
  end

  # GET /ccomments/new
  # GET /ccomments/new.xml
  def new
    @ccomment = Ccomment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ccomment }
    end
  end

  # GET /ccomments/1/edit
  def edit
    @ccomment = Ccomment.find(params[:id])
  end

  # POST /ccomments
  # POST /ccomments.xml
  def create
    @ccomment = Ccomment.new(params[:ccomment])

    respond_to do |format|
      if @ccomment.save
        format.html { redirect_to(@ccomment, :notice => 'Ccomment was successfully created.') }
        format.xml  { render :xml => @ccomment, :status => :created, :location => @ccomment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ccomment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ccomments/1
  # PUT /ccomments/1.xml
  def update
    @ccomment = Ccomment.find(params[:id])

    respond_to do |format|
      if @ccomment.update_attributes(params[:ccomment])
        format.html { redirect_to(@ccomment, :notice => 'Ccomment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ccomment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ccomments/1
  # DELETE /ccomments/1.xml
  def destroy
    @ccomment = Ccomment.find(params[:id])
    @ccomment.destroy

    respond_to do |format|
      format.html { redirect_to(ccomments_url) }
      format.xml  { head :ok }
    end
  end
end
