require 'rails_helper'

RSpec.describe 'episode_statements/new', type: :view do
  let(:episode) { Episode.create!(name: 'Episode') }

  before(:each) do
    @episode = episode

    assign(:episode_statement, EpisodeStatement.new(
                                 episode: episode,
                                 statement: 'MyString',
                                 correct: false
                               ))
  end

  it 'renders new episode_statement form' do
    render

    assert_select 'form[action=?][method=?]', episode_episode_statements_path(episode_id: episode.id), 'post' do
      assert_select 'input[name=?]', 'episode_statement[statement]'
      assert_select 'input[name=?]', 'episode_statement[correct]'
    end
  end
end
