class Address < ApplicationRecord
  belongs_to :customer

  validates :name, :address, :postal_code, presence: true
  validates :postal_code, length: { is: 7 }
end
