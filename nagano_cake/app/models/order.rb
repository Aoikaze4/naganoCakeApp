class Order < ApplicationRecord
  has_many :order_items

  belongs_to :customer

  enum payment_method: [:credit_card, :bank], _prefix: true
  enum order_status: { "注文待機中": 0, "支払い済み": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }, _suffix: :status
  #0→注文待機中　1→支払い済み 2→発送準備中　3→発送済み

end
