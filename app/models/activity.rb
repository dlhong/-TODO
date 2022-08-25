class Activity < ApplicationRecord
  has_many :activity_participant
  has_many :savings
  has_many :reviews
  has_many :activity_types

  validates :name, presence: true
  validates :address, presence: true
  validates_length_of :summary, minimum: 2
  validates :contact_info, presence: true
end
