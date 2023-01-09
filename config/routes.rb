Rails.application.routes.draw do
  root to: 'top_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#delete'
  get 'categories/index'
  get 'categories/edit'
  get 'favorites/create'
  get 'favorites/destroy'
  
  resources :comments, only: %i[create destroy]
  resources :posts
  resources :users, only: %i[new create]
end
