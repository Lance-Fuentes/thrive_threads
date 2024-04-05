class Product < ApplicationRecord
  belongs_to :category
  has_many_attached :images
  validates :name, :price, :description, :category_id, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "description", "id", "name", "price", "updated_at", "images_attachments_id_eq", "images_blobs_id_eq"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end
