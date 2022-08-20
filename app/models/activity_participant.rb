class ActivityParticipant < ApplicationRecord
  belongs_to :participant
  belongs_to :activity
end
