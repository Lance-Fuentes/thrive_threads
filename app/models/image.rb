class Image < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :order, optional: true

  has_one_attached :file

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "order_id", "product_id", "updated_at"]
  end
end
