Rails.application.routes.draw do
  root "books#index"
  resources :books, only: [:index, :show]
  resources :chapters, only: [:show]
  resources :puzzles, only: [:show]
end
