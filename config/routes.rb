# config/routes.rb
Rails.application.routes.draw do
  resources :movies, only: [:index, :show] do
    post 'add_to_favorites', on: :member
    get 'add_to_favorites', on: :member
    get 'favorites', on: :collection
    get 'destroy_favorite', on: :member
    post 'destroy_favorite', on: :member
  end
  root to: 'movies#index'
end
