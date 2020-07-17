require 'rails_helper'

RSpec.describe '/episodes', type: :request do
  let(:episode) { Episode.create!(name: 'Episode') }

  let(:valid_attributes) do
    {
      name: 'Episode Title'
    }
  end

  let(:invalid_attributes) do
    {
      name: ''
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Episode.create! valid_attributes
      get episodes_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get episode_url(episode)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_episode_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      get edit_episode_url(episode)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Episode' do
        expect do
          post episodes_url, params: { episode: valid_attributes }
        end.to change(Episode, :count).by(1)
      end

      it 'redirects to the created episode' do
        post episodes_url, params: { episode: valid_attributes }
        expect(response).to redirect_to(episode_url(Episode.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Episode' do
        expect do
          post episodes_url, params: { episode: invalid_attributes }
        end.to change(Episode, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post episodes_url, params: { episode: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          name: 'Foobar'
        }
      end

      it 'updates the requested episode' do
        patch episode_url(episode), params: { episode: new_attributes }

        episode.reload

        expect(episode.name).to eq('Foobar')
      end

      it 'redirects to the episode' do
        patch episode_url(episode), params: { episode: new_attributes }
        episode.reload
        expect(response).to redirect_to(episode_url(episode))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch episode_url(episode), params: { episode: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:episode) { Episode.create!(name: 'Episode') }

    it 'destroys the requested episode' do
      expect do
        delete episode_url(episode)
      end.to change(Episode, :count).by(-1)
    end

    it 'redirects to the episodes list' do
      delete episode_url(episode)
      expect(response).to redirect_to(episodes_url)
    end
  end
end
