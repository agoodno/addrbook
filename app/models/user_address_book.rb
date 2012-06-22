class UserAddressBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :address_book
end
