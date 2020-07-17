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

    it 'assigns correct false on incorrect answer' do
      patch game_url(episode), params: { statement_id: incorrect_answer.id }

      expect(response).to be_successful
      expect(assigns(:correct)).to eq(false)
    end

    it 'assigns correct true on correct answer' do
      patch game_url(episode), params: { statement_id: correct_answer.id }

      expect(response).to be_successful
      expect(assigns(:correct)).to eq(true)
    end
  end

  describe 'POST /leaderboard' do
    it 'create game score for username if does not exist' do
      post leaderboard_game_url(episode), params: { username: 'Test' }

      game_score = GameScore.first

      expect(response).to be_successful
      expect(assigns(:correct)).to be_nil
      expect(GameScore.count).to eq(1)
      expect(game_score.username).to eq('Test')
      expect(game_score.score).to eq(1)
    end

    it 'updates score if it already exists' do
      game_score = GameScore.create!(episode: episode, username: 'Test', score: 1)

      post leaderboard_game_url(episode), params: { username: 'Test' }

      game_score.reload

      expect(response).to be_successful

      expect(GameScore.count).to eq(1)
      expect(game_score.username).to eq('Test')
      expect(game_score.score).to eq(2)
    end
  end
end
