class Address < ApplicationRecord
  belongs_to :customer

  validates :name, :address, :postal_code, presence: true
  validates :postal_code, length: { is: 7 }

  def view_address_and_name
    "〒" + self.postal_code.to_s + " " + self.address + " " + self.name
  end
end
