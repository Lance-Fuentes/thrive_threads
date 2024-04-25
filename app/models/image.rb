class Image < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :order, optional: true

  has_one_attached :file

  validates :file, presence: true
  validates :product_id, presence: true
  validates :order_id, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "order_id", "product_id", "updated_at"]
  end
end
