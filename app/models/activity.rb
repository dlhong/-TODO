class Activity < ApplicationRecord
  has_many :activity_participant
  has_many :savings
  has_many :reviews
  has_many :activity_types
  has_many_attached :photos

  validates :name, presence: true
  validates :address, presence: true
  validates_length_of :summary, minimum: 2
  validates :contact_info, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_by_attr,
                  against: %i[name address price summary],
                  using: {
                    tsearch: { prefix: true }
                  }
end
