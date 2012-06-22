class CreateFamilies < ActiveRecord::Migration
  def self.up
    create_table :families do |t|
      t.string :informal_name
      t.string :formal_name
      t.string :addr_line_1
      t.string :addr_line_2
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end

  def self.down
    drop_table :families
  end
end
