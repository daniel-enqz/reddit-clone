Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "links#index"
  
  resources :links, only: [:index, :show, :new, :create] do
    resources :votes, only: [:create]
  end

  # Delete a vote
  delete "/votes/:id", to: "votes#destroy", as: "vote"

  namespace :api do
    namespace :v1 do
      resources :links, only: [:index, :create]
    end
  end
end
