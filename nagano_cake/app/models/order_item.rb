class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  enum make_status: { cannot:0, wait:1, making:2, complete:3 }, _prefix: true
end
