class EpisodeStatement < ApplicationRecord
  belongs_to :episode

  validates :statement, presence: true
end
