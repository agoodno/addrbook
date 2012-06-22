class Family < ActiveRecord::Base
  belongs_to :address_book
  has_many :members

  def full_name
    return informal_name
  end

  def address
    return addr_line_1 + " " + addr_line_2
  end

  def full_address
    return address + " " + city + ", " + state + " " + zip_code
  end

end
