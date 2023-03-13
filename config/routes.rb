Rails.application.routes.draw do
  root to: 'top_pages#top'
  get 'privacy', to: 'footer_links#privacy'
  get 'terms', to: 'footer_links#terms'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  get 'logout', to: 'user_sessions#destroy'
  post 'follow/:id', to: 'follow_relationships#create', as: 'follow'
  post 'unfollow/:id', to: 'follow_relationships#destroy', as: 'unfollow'
  get 'toys/search', to: 'toys#search'

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
    member do
      get :followings, :followers
    end
  end
  resource :profile, only: %i[show edit update]
  resources :others_profiles, path: 'profile',only: %i[show] do
    member do
     get :others_post, path: 'posts'
    end
  end
end
