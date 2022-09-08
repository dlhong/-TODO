class Type < ApplicationRecord
  has_many :activity_types

  # validates :name, inclusion: { in: %w[Running Swimming Yoga] }
  validates :name, presence: true
  validates :name, uniqueness: true
end
