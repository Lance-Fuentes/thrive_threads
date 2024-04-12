class Product < ApplicationRecord
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, :price, :description, :category_id, presence: true

  scope :on_sale, -> { where(on_sale: true) }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "name", "price", "updated_at", "on_sale_eq"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "images"]
  end
end
