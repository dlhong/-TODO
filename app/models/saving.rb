class Saving < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  # validates :attendance, presence: true
  validates :activity_id, uniqueness: { scope: :user_id }
end
