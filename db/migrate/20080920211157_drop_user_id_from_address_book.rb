class DropUserIdFromAddressBook < ActiveRecord::Migration
  def self.up
    remove_column :address_books, :user_id
  end

  def self.down
    add_column :address_books, :user_id
  end
end
