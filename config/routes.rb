Rails.application.routes.draw do
  resources :episodes do
    resources :episode_statements, except: [:index, :show]
  end
end
