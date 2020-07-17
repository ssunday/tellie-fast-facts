require 'rails_helper'

RSpec.describe '/game', type: :request do
  let(:episode) { Episode.create!(name: 'Episode') }

  describe 'GET /show' do
    it 'renders a successful response' do
      get game_url(episode)
      expect(response).to be_successful
    end
  end

  describe 'PUT /' do
    let!(:correct_answer) { episode.episode_statements.create!(statement: 'test', correct: true) }
    let!(:incorrect_answer) { episode.episode_statements.create!(statement: 'correct test', correct: false) }
    it 'redirects to the game on incorrect answer' do
      patch game_url(episode), params: { statement_id: incorrect_answer.id }

      expect(response).to redirect_to(game_url(episode))
      expect(flash[:notice]).to eq('You are incorrect!')
    end

    it 'redirects to the game on incorrect answer' do
      patch game_url(episode), params: { statement_id: correct_answer.id }

      expect(response).to redirect_to(game_url(episode))
      expect(flash[:notice]).to eq('You are correct!')
    end
  end
end
