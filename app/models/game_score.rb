class GameScore < ApplicationRecord
  belongs_to :episode

  validates :username, presence: true
  validates :username, uniqueness: {
    scope: :episode_id,
    message: 'should be unique to episode leaderboard'
  }
end
