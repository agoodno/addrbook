class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.integer :family_id, :null => false
      t.string :first_name
      t.string :last_name
      t.string :home_phone
      t.string :work_phone
      t.string :cell_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
