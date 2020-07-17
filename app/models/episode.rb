class Episode < ApplicationRecord
  has_many :episode_statements, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
