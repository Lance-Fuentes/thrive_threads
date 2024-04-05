class Order < ApplicationRecord
  belongs_to :user
  has_many :user_images
end
