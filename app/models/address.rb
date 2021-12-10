class Address < ApplicationRecord
  belongs_to :customer

  def view_address
   #self.postal_code + self.address + self.name
   return "〒#{self.postal_code}#{self.address}#{self.name}"
  end

end
