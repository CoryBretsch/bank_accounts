Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/customers/new", to: "customers#new"
  get "/customers/:id", to: "customers#show", as: "customer"
  get "/customers", to: "customers#index"
  get "/customers/:id/edit", to: "customers#edit"
  post "/customers", to: "customers#create"
  patch "/customers/:id", to: "customers#update"

  get "/accounts", to: "accounts#index"   
  get "/accounts/:id", to: "accounts#show"
  
  get "/customers/:customer_id/accounts", to: "customer_accounts#index"
  
  

  # Defines the root path route ("/")
  # root "posts#index"
end
