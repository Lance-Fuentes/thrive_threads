class User < ApplicationRecord
  has_many :orders
  has_many :user_roles
  has_many :roles, through: :user_roles
  validates :username, :password, :email, :address, presence: true
end
