Rails.application.routes.draw do
  root to: redirect('/profiles')

  devise_for :users

  resources :profiles, only: %i[index show] do
    resources :posts, shallow: true, only: %i[new create]
  end
end
