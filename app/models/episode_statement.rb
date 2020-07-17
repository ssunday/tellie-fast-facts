class EpisodeStatement < ApplicationRecord
  belongs_to :episode

  scope :alphabetical, -> { order(:statement) }

  validates :statement, presence: true
end
