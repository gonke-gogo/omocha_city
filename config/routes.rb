Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  resources :posts
  resources :users, only: %i[new create]
end
