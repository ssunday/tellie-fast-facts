class Episode < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
