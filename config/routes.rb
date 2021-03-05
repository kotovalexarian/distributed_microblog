Rails.application.routes.draw do
  resources :profiles, only: %i[index show]
end
