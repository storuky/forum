Rails.application.routes.draw do
  root to: 'groups#index'

  devise_for :users, controllers: {
    sessions: 'auth/sessions',
    registrations: 'auth/registrations',
  }

  post "uploads/avatar" => "uploads#avatar"

  get "search" => "search#index"

  resources :groups
  resources :themes
  resources :topics
  resources :posts
  resources :users, only: [:index, :show] do
    collection do
      get "touch"
      get "metrics"
    end
    member do
      put "rate"
      put "ban"
      put "unban"
    end
  end
end
