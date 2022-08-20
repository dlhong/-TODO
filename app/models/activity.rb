class Activity < ApplicationRecord
  has_many :activity_participant
  has_many :savings
  has_many :reviews
  has_many :actibity_types
end
