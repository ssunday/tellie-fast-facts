require 'rails_helper'

RSpec.describe 'episodes/edit', type: :view do
  before(:each) do
    @episode = assign(:episode, Episode.create!(
                                  name: 'MyString'
                                ))
  end

  it 'renders the edit episode form' do
    render

    assert_select 'form[action=?][method=?]', episode_path(@episode), 'post' do
      assert_select 'input[name=?]', 'episode[name]'
    end
  end
end
