Rails.application.routes.draw do
  root to: 'top_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'
  post 'follow/:id', to: 'follow_relationships#create', as: 'follow'
  post 'unfollow/:id', to: 'follow_relationships#destroy', as: 'unfollow'

  resources :comments, only: %i[create destroy]
  resources :posts do
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get :favorites, :myselfs
    end
  end
  resources :categories, only: %i[index]
  resources :favorites, only: %i[create destroy]
  resources :users, only: %i[new create show] do
  end
  resource :profile, only: %i[show edit update]
  resources :others_profiles, only: %i[show] do
    member do
     get :others_post
    end
  end
end
