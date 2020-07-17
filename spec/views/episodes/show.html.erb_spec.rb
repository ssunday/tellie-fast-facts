require 'rails_helper'

RSpec.describe 'episodes/show', type: :view do
  before(:each) do
    @episode = assign(:episode, Episode.create!(
                                  name: 'Name'
                                ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Statements/)
  end
end
