class Address < ApplicationRecord
  belongs_to :customer

  validates :name, :address_name, :postal_code, presence: true
  validates :postal_code, length: { is: 7 }

  def view_address_and_name
    "〒" + self.postal_code.to_s + " " + self.address_name + " " + self.name
  end
end
