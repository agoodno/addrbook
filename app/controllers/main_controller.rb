class MainController < ApplicationController
  before_filter :login_required

  # GET /main
  # GET /main.xml
  def index
    @user_address_books = UserAddressBook.find(:all,
                                               :conditions => ['user_id = ?', session[:user_id]])
    if params[:user_address_book] != nil && params[:user_address_book][:id] != nil
      session[:user_address_book] = UserAddressBook.find_by_id(params[:user_address_book][:id])
    end

    if session[:user_address_book].blank?
      session[:user_address_book] = UserAddressBook.find(:first,
                                               :conditions => ['user_id = ?', session[:user_id]])
    end

    @user_address_book = session[:user_address_book]

#     puts "SessUserId: #{session[:user_id]}"
#     puts "SessUserAddrId: #{session[:user_address_book].address_book.title}"
    @families = Family.find(:all,
                            :conditions => ['address_book_id = ?', session[:user_address_book].address_book_id],
                            :order => 'informal_name')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @user_address_books }
    end
  end

  # GET /main/1
  # GET /main/1.xml
  def show
    @family = Family.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @main }
    end
  end

  # GET /families/new
  # GET /families/new.xml
  def new
    @family = Family.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @family }
    end
  end

  # GET /families/1/edit
  def say_when
    @family = Family.find(params[:id])
    render :layout => false
#     render :update do |page|
#       page.show 'andyrow'
#     end
  end

  # GET /families/1/edit
  def edit
    @family = Family.find(params[:id])
    render :text => "<b>#{@family.informal_name}</b>"
  end

  # POST /families
  # POST /families.xml
  def create
    @family = Family.new(params[:family])

    respond_to do |format|
      if @family.save
        flash[:notice] = 'Family was successfully created.'
        format.html { redirect_to(@family) }
        format.xml  { render :xml => @family, :status => :created, :location => @family }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @family.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /families/1
  # PUT /families/1.xml
  def update
    @family = Family.find(params[:id])

    respond_to do |format|
      if @family.update_attributes(params[:main])
        flash[:notice] = 'Family was successfully updated.'
        format.html { redirect_to('/') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @family.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /main/1
  # DELETE /main/1.xml
  def destroy
    @family = Family.find(params[:id])
    @family.destroy
    @family = nil
    puts 'destroyed'
    respond_to do |format|
      format.html { redirect_to('/') }
      format.xml  { head :ok }
    end
  end

end
