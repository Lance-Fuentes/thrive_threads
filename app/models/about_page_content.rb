class AboutPageContent < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[content created_at updated_at]
  end
end
