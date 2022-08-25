class Saving < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  # validates :attendance, presence: true
end
