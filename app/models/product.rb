class Product < ApplicationRecord
  belongs_to :category
  has_many :images
  validates :name, :price, :description, presence: true
end
