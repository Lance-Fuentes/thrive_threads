class Order < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  validates :total, :description, :status, presence: true
end
