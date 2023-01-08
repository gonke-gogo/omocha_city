Rails.application.routes.draw do
  root to: 'top_pages#top'
  get 'categories/index'
  get 'categories/edit'
  get 'favorites/create'
  get 'favorites/destroy'
  resources :comments, only: %i[create destroy]
  resources :posts
  resources :users, only: %i[new create]
end
