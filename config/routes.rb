Rails.application.routes.draw do
  root "static_pages#home"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :users 
  resources :categories
  resources :services
  resources :bills
  resources :rooms do
    resources :bills
  end
  post "/search", to: "users#index"
end
