require 'rails_helper'

RSpec.describe EpisodeStatementsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/episodes/4/episode_statements/new').to route_to('episode_statements#new', episode_id: '4')
    end

    it 'routes to #edit' do
      expect(get: '/episodes/4/episode_statements/1/edit').to route_to('episode_statements#edit', id: '1', episode_id: '4')
    end

    it 'routes to #create' do
      expect(post: '/episodes/4/episode_statements').to route_to('episode_statements#create', episode_id: '4')
    end

    it 'routes to #update via PUT' do
      expect(put: '/episodes/4/episode_statements/1').to route_to('episode_statements#update', id: '1', episode_id: '4')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/episodes/4/episode_statements/1').to route_to('episode_statements#update', id: '1', episode_id: '4')
    end

    it 'routes to #destroy' do
      expect(delete: '/episodes/4/episode_statements/1').to route_to('episode_statements#destroy', id: '1', episode_id: '4')
    end
  end
end
