Rails.application.routes.draw do
  get 'avatars/show'

  get  'profile', to: 'profile#edit', as: :profile
  post 'profile/update'
  

  post "search_conversations", to: "search#conversations"
  get "conversations", to: "conversations#index", as: :conversations
  
  resources :messages
  resources :conversations, only: [:index, :show, :new] do 
      resources :messages
  end

  resources :products do 
      resources :conversations, only: [:create, :new, :index]
  end


  
  root to:  'home#index'
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks"}
  resources :products
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
