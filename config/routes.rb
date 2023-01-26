Rails.application.routes.draw do
  root to: 'top_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'
  get 'categories/index'
  get 'categories/edit'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'posts/category/:id', to: 'posts#category'


  resources :comments, only: %i[create destroy]
  resources :posts do
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get :favorites
    end
  end
  resources :favorites, only: %i[create destroy]
  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :others_profiles, only: %i[show]
end
