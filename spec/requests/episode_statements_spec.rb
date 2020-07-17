require 'rails_helper'

RSpec.describe '/episode_statements', type: :request do
  let(:episode) { Episode.create!(name: 'Episode') }
  let(:valid_attributes) do
    {
      episode_id: episode.id,
      statement: 'Foobar'
    }
  end

  let(:invalid_attributes) do
    {
      statement: ''
    }
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_episode_episode_statement_url(episode)

      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      episode_statement = EpisodeStatement.create! valid_attributes

      get edit_episode_episode_statement_url(episode_id: episode.id, id: episode_statement.id)

      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new EpisodeStatement' do
        expect do
          post episode_episode_statements_url(episode), params: { episode_id: episode.id, episode_statement: valid_attributes }
        end.to change(EpisodeStatement, :count).by(1)
      end

      it 'redirects to the episode path' do
        post episode_episode_statements_url(episode), params: { episode_id: episode.id, episode_statement: valid_attributes }
        expect(response).to redirect_to(episode_url(episode))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new EpisodeStatement' do
        expect do
          post episode_episode_statements_url(episode), params: { episode_id: episode.id, episode_statement: invalid_attributes }
        end.to change(EpisodeStatement, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post episode_episode_statements_url(episode), params: { episode_id: episode.id, episode_statement: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          statement: 'new statement'
        }
      end

      it 'updates the requested episode_episode_statement' do
        episode_statement = EpisodeStatement.create! valid_attributes
        patch episode_episode_statement_url(episode, episode_statement), params: { episode_statement: new_attributes }
        episode_statement.reload

        expect(episode_statement.statement).to eq('new statement')
      end

      it 'redirects to the episode path' do
        episode_statement = EpisodeStatement.create! valid_attributes
        patch episode_episode_statement_url(episode_id: episode.id, id: episode_statement.id), params: { episode_statement: new_attributes }

        expect(response).to redirect_to(episode_url(episode))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        episode_statement = EpisodeStatement.create! valid_attributes
        patch episode_episode_statement_url(episode_id: episode.id, id: episode_statement.id), params: { episode_statement: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested episode_episode_statement' do
      episode_statement = EpisodeStatement.create! valid_attributes
      expect do
        delete episode_episode_statement_url(episode, episode_statement)
      end.to change(EpisodeStatement, :count).by(-1)
    end

    it 'redirects to the episode path' do
      episode_statement = EpisodeStatement.create! valid_attributes

      delete episode_episode_statement_url(episode, episode_statement)

      expect(response).to redirect_to(episode_url(episode))
    end
  end
end
