class ProfileRelationsController < ApplicationController
  # GET /profile_relations
  # GET /profile_relations.xml
  def index
    @profile_relations = ProfileRelation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_relations }
    end
  end

  # GET /profile_relations/1
  # GET /profile_relations/1.xml
  def show
    @profile_relation = ProfileRelation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_relation }
    end
  end

  # GET /profile_relations/new
  # GET /profile_relations/new.xml
  def new
    @profile_relation = ProfileRelation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_relation }
    end
  end

  # GET /profile_relations/1/edit
  def edit
    @profile_relation = ProfileRelation.find(params[:id])
  end

  # POST /profile_relations
  # POST /profile_relations.xml
  def create
    @profile_relation = ProfileRelation.new(params[:profile_relation])

    respond_to do |format|
      if @profile_relation.save
        format.html { redirect_to(@profile_relation, :notice => 'Profile relation was successfully created.') }
        format.xml  { render :xml => @profile_relation, :status => :created, :location => @profile_relation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_relations/1
  # PUT /profile_relations/1.xml
  def update
    @profile_relation = ProfileRelation.find(params[:id])

    respond_to do |format|
      if @profile_relation.update_attributes(params[:profile_relation])
        format.html { redirect_to(@profile_relation, :notice => 'Profile relation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_relations/1
  # DELETE /profile_relations/1.xml
  def destroy
    @profile_relation = ProfileRelation.find(params[:id])
    @profile_relation.destroy

    respond_to do |format|
      format.html { redirect_to(profile_relations_url) }
      format.xml  { head :ok }
    end
  end
end
