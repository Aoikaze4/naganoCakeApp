class Public::CustomersController < ApplicationController
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
