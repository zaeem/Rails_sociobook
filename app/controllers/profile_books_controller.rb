class ProfileBooksController < ApplicationController
  # GET /profile_books
  # GET /profile_books.xml
  def index
    @profile_books = ProfileBook.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profile_books }
    end
  end

  # GET /profile_books/1
  # GET /profile_books/1.xml
  def show
    @profile_book = ProfileBook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @profile_book }
    end
  end

  # GET /profile_books/new
  # GET /profile_books/new.xml
  def new
    @profile_book = ProfileBook.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @profile_book }
    end
  end

  # GET /profile_books/1/edit
  def edit
    @profile_book = ProfileBook.find(params[:id])
  end

  # POST /profile_books
  # POST /profile_books.xml
  def create
    @profile_book = ProfileBook.new(params[:profile_book])

    respond_to do |format|
      if @profile_book.save
        format.html { redirect_to(@profile_book, :notice => 'Profile book was successfully created.') }
        format.xml  { render :xml => @profile_book, :status => :created, :location => @profile_book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @profile_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /profile_books/1
  # PUT /profile_books/1.xml
  def update
    @profile_book = ProfileBook.find(params[:id])

    respond_to do |format|
      if @profile_book.update_attributes(params[:profile_book])
        format.html { redirect_to(@profile_book, :notice => 'Profile book was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /profile_books/1
  # DELETE /profile_books/1.xml
  def destroy
    @profile_book = ProfileBook.find(params[:id])
    @profile_book.destroy

    respond_to do |format|
      format.html { redirect_to(profile_books_url) }
      format.xml  { head :ok }
    end
  end
end
