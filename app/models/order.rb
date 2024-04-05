class Order < ApplicationRecord
  belongs_to :user
  has_many :user_images
  validates :total, :description, :status, presence: true
end
