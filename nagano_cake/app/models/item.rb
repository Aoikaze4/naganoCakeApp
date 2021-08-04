class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_items

  belongs_to :genre

  attachment :image

  validates :name, :introduction, :genre_id, :price, presence: true
  validates :price, numericality: {only_integer: true, greater_than: 0}

end