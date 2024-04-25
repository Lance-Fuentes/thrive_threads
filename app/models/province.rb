class Province < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
