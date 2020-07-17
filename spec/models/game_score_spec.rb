require 'rails_helper'

RSpec.describe GameScore, type: :model do
  it { should validate_presence_of(:username) }
  it { should belong_to(:episode) }
end
