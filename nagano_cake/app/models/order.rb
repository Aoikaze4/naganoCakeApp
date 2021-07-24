class Order < ApplicationRecord
  has_many :order_items

  belongs_to :customer

  enum order_status: { wait: 0, paid: 1, prepaer: 2, send: 3 }

  enum payment_method: {credit_card: 0, bank: 1}
end
