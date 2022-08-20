class Participant < ApplicationRecord
  has_many :activity_participant

  validates :type, inclusion: { in: %w[solo pair small_group large_group] }
end
