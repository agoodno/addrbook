require 'test_helper'

class UserAddressBooksControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:user_address_books)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_user_address_book
    assert_difference('UserAddressBook.count') do
      post :create, :user_address_book => { }
    end

    assert_redirected_to user_address_book_path(assigns(:user_address_book))
  end

  def test_should_show_user_address_book
    get :show, :id => user_address_books(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => user_address_books(:one).id
    assert_response :success
  end

  def test_should_update_user_address_book
    put :update, :id => user_address_books(:one).id, :user_address_book => { }
    assert_redirected_to user_address_book_path(assigns(:user_address_book))
  end

  def test_should_destroy_user_address_book
    assert_difference('UserAddressBook.count', -1) do
      delete :destroy, :id => user_address_books(:one).id
    end

    assert_redirected_to user_address_books_path
  end
end
