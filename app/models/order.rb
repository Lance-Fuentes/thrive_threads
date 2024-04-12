class Order < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  validates :total, :description, :status, presence: true
end
