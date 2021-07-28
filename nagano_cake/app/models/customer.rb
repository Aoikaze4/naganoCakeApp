class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :telephone_number, presence: true, uniqueness: true
  validates :postal_code, exclusion: { in: %w(-)}, length: {is: 7}
  validates :last_name, :first_name, :last_name_kana, :first_name_kana,
            :postal_code, :address, presence: true

  def active_for_authentication?
    super && (self.is_active == true)
  end

  has_many :addresses
  has_many :cart_items
  has_many :orders
end
