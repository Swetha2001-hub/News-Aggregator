Rails.application.routes.draw do
  get "dashboard/index"
  root "articles#index"
  get "/articles", to: "articles#index"
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
delete "/logout", to: "sessions#destroy"
get "trending", to: "favorites#trending"
resources :likes, only: [:create]

resources :users, only: [:new, :create]
resources :articles, only: [:index]
resources :favorites, only: [:index, :create, :destroy] do
  resources :comments, only: [:create, :edit, :update, :destroy]
end

end
