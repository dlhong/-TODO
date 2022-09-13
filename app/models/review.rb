class Review < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  validates :ratings, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates_length_of :content, minimum: 5
  validates :title, presence: true
end
