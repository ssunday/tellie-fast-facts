Rails.application.routes.draw do
  root to: 'home#index'

  resources :game, only: %i[show update]

  resources :episodes do
    resources :episode_statements, except: %i[index show]
  end
end
