require 'rails_helper'

RSpec.describe Episode, type: :model do
  subject { described_class.create(name: 'Test name') }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
