Rails.application.routes.draw do
  root to: 'home#show'

  devise_for :users

  resources :addresses, only: %i[index show]

  resources :profiles, only: %i[index show] do
    resources :posts, shallow: true, only: %i[new create]
  end
end
