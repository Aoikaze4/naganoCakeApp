class Order < ApplicationRecord
  has_many :order_items

  belongs_to :customer

  enum payment_method: [:credit_card, :bank], _prefix: true
  enum order_status: { wait: 0, paid: 1, making: 2, prepaer: 3, send: 4 }, _suffix: :status
  #0→注文待機中　1→支払い済み 2→発送準備中　3→発送済み

end
