class AddressBook < ActiveRecord::Base
  has_many :users, :through => :user_address_books
  has_many :families
end
