class Restaurant < ApplicationRecord
  validates :name, :address, :rating, presence: true
  has_many :reviews, dependent: :destroy
end
