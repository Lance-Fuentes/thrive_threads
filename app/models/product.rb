class Product < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy
  validates :name, :price, :description, :category_id, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "price", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "images"]
  end
end
