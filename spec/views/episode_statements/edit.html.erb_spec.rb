require 'rails_helper'

RSpec.describe 'episode_statements/edit', type: :view do
  let(:episode) { Episode.create!(name: 'Episode') }

  before(:each) do
    @episode = episode
    @episode_statement = assign(
      :episode_statement,
      EpisodeStatement.create!(
        episode: episode,
        statement: 'MyString',
        correct: false
      )
    )
  end

  it 'renders the edit episode_statement form' do
    render

    assert_select 'form[action=?][method=?]', episode_episode_statement_path(episode_id: episode.id, id: @episode_statement.id), 'post' do
      assert_select 'input[name=?]', 'episode_statement[statement]'

      assert_select 'input[name=?]', 'episode_statement[correct]'
    end
  end
end
