class UserAddressBooksController < ApplicationController
  before_filter :login_required

  # GET /user_address_books
  # GET /user_address_books.xml
  def index
    @user_address_books = UserAddressBook.find(:all,
                                               :conditions => ['user_id = ?', session[:user_id]])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_address_books }
    end
  end

  # GET /user_address_books/1
  # GET /user_address_books/1.xml
  def show
    @user_address_book = UserAddressBook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user_address_book }
    end
  end

  # GET /user_address_books/new
  # GET /user_address_books/new.xml
  def new
    @user_address_book = UserAddressBook.new
    @address_books = AddressBook.find(:all)
    @users = User.find(:all)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_address_book }
    end
  end

  # GET /user_address_books/1/edit
  def edit
    @user_address_book = UserAddressBook.find(params[:id])
  end

  # POST /user_address_books
  # POST /user_address_books.xml
  def create
    @user_address_book = UserAddressBook.new(params[:user_address_book])

    respond_to do |format|
      #puts "Title:#{params[:new_title]}"
      if !params[:new_title].empty?
        @address_book = AddressBook.new
        @address_book.title = params[:new_title]
        if @address_book.save
          #puts "Saved book id: #{@address_book.id}"
          @user_address_book.address_book_id = @address_book.id
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @user_address_book.errors, :status => :unprocessable_entity }
        end
      end
      #puts @user_address_book.user_id
      #puts @user_address_book.address_book_id
      if @user_address_book.save
        flash[:notice] = 'UserAddressBook was successfully created.'
        format.html { redirect_to(@user_address_book) }
        format.xml  { render :xml => @user_address_book, :status => :created, :location => @user_address_book }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user_address_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /user_address_books/1
  # PUT /user_address_books/1.xml
  def update
    @user_address_book = UserAddressBook.find(params[:id])

    respond_to do |format|
      if @user_address_book.update_attributes(params[:user_address_book])
        flash[:notice] = 'UserAddressBook was successfully updated.'
        format.html { redirect_to(@user_address_book) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user_address_book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /user_address_books/1
  # DELETE /user_address_books/1.xml
  def destroy
    @user_address_book = UserAddressBook.find(params[:id])
    @user_address_book.destroy

    respond_to do |format|
      format.html { redirect_to(user_address_books_url) }
      format.xml  { head :ok }
    end
  end
end
