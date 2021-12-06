class Review < ApplicationRecord
  belongs_to :list
  validates :comment, presence: true, length: { minimum: 6 }
  validates :rating, presence: true, numericality: { only_integer: true }
  validates :list, uniqueness: true
end
