Rails.application.routes.draw do
  resources :notifications
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :rentals
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get '/search/books' , to: "search#books"
  get '/search/index' , to: "search#index"
  get '/search/allbooks' , to: "search#allbooks"
  get '/contact', to: "welcome#contact"
  get '/about', to: "welcome#about"
  get '/hours', to: "welcome#hours"
  get '/events', to: "welcome#events"

  get '/order_items/order_all', to: 'order_items#order_all'

  post '/rentals/:id', to: "rentals#update"
  post '/rentals/renew/:id', to: "rentals#renew"

  post '/order_items/order_all', to: "order_items#order_all"

  resources :categories
  resources :books
  resources :order_items, :except => [:show]
  resources :carts, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "welcome#index"

end
