Rails.application.routes.draw do
  resources :posts
  resources :users, only: %i[new create]
end
