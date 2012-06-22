class AddFamilyAddrBookId < ActiveRecord::Migration
  def self.up
    add_column :families, :address_book_id, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :families, :address_book_id
  end
end
