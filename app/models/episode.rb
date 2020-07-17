class Episode < ApplicationRecord
  has_many :episode_statements, dependent: :destroy
  has_many :game_scores, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
