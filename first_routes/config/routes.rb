Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :users, only: [:create, :destroy, :index, :show, :update] do 
    resources :artwork_shares, only: [:index]
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end
  resources :artworks, only: [:create, :destroy, :show, :update] do
    resources :comments, only: [:index]
  end
  resources :artwork_shares, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
end
