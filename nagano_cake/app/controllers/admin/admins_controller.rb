class Admin::AdminsController < ApplicationController
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
