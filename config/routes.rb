require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  root 'home#welcome'

  resources :genres, only: :index do
    member do
      get 'movies'
    end
  end

  resources :movies, only: [:index, :show] do
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end

  namespace :api, defaults: { format: :json } do
    scope module: :v1 do
      resources :apidocs, only: :index

      resources :movies, only: [:show, :index]
    end
  end
end
