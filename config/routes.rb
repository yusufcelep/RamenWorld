Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root :to => "sessions#new"
  get '/login', to: 'sessions#new', as: 'login'
  post "/login", to: "sessions#create"
  get '/signup', to: 'users#new', as: 'signup'
  post "/signup", to: "users#create"
  delete "/logout", to: "sessions#destroy", as: 'logout'
  resources :recommendations
  resources :shop_reviews
  resources :shops, only: [:index, :show, :new, :create]
  resources :ramens, only: :show
  resources :users, except: :index

end
