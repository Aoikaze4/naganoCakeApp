class Order < ApplicationRecord
  has_many :order_items

  belongs_to :customer

  enum order_status: { wait: 0, paid: 1, prepaer: 2, send: 3 }
  #0→注文待機中　1→支払い済み 2→発送準備中　3→発送済み

  enum payment_method: {credit_card: 0, bank: 1}
  #0→クレジットカード 1→銀行振込
end
