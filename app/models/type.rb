class Type < ApplicationRecord
  has_many :activity_types

  validates :name, inclusion: { in: %w[Running Swimming Yoga] }
end
