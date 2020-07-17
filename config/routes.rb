Rails.application.routes.draw do
  root to: 'home#index'

  resources :game, only: %i[show update] do
    member do
      post :leaderboard
    end
  end

  resources :episodes do
    resources :episode_statements, except: %i[index show]
  end
end
