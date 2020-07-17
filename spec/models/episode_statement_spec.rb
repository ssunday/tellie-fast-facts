require 'rails_helper'

RSpec.describe EpisodeStatement, type: :model do
  it { should validate_presence_of(:statement) }
  it { should belong_to(:episode) }
end
