class CreateUserAddressBooks < ActiveRecord::Migration
  def self.up
    create_table :user_address_books do |t|
      t.column :user_id, :integer, :null => false
      t.column :address_book_id, :integer, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :user_address_books
  end
end
