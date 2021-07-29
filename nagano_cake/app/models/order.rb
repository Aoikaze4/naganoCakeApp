class Order < ApplicationRecord
  has_many :order_items

  belongs_to :customer

  enum payment_method: [:credit_card, :bank], _prefix: true
  enum order_status: { "入金待機中": 0, "支払い済み": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }, _suffix: :status
end
