class AdminController < ApplicationController

  def index
    redirect_to address_books_url
  end

end
