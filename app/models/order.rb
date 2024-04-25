class Order < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  validates :total, :description, :status, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 0 }
end
