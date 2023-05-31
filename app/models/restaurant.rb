class Restaurant < ApplicationRecord
  validates :name, :address, :rating, presence: true
end
