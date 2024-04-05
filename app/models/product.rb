class Product < ApplicationRecord
  belongs_to :category
  has_many :images
  validates :name, :price, :description, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "name", "price", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "images"]
  end
end
