Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "links#index"
  
  resources :links, only: [:index, :new, :create] do
    resources :votes, only: [:create, :destroy]
  end
end
