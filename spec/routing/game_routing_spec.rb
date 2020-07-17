require 'rails_helper'

RSpec.describe GameController, type: :routing do
  describe 'routing' do
    it 'routes to #show' do
      expect(get: '/game/4').to route_to('game#show', id: '4')
    end

    it 'routes to #update via PUT' do
      expect(put: '/game/4').to route_to('game#update', id: '4')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/game/4').to route_to('game#update', id: '4')
    end
  end
end
