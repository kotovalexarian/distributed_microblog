Rails.application.routes.draw do
  root to: redirect('/profiles')

  devise_for :users

  resources :profiles, only: %i[index show]
end
