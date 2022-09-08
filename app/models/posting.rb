class Posting < ApplicationRecord
  belongs_to :user
  has_rich_text :content
  validates_length_of :content, minimum: 5
end
