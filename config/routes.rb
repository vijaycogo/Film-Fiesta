# config/routes.rb
Rails.application.routes.draw do
  resources :movies, only: [:index, :show] do
    get 'favorites', on: :collection
  end
  root to: 'movies#index'
end
