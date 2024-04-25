class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :province
  has_many :orders
  has_many :user_roles
  has_many :roles, through: :user_roles
  validates :password, :email, :address, :city, presence: true

end
