Rails.application.routes.draw do
  resources :reviews, only: [:destroy]

  resources :restaurants do
    resources :reviews, only: [:new, :create]

    # verb + path
    # /restaurants/something
    collection do
      # verb + path
      # /restaurants/top
      get 'top'
    end

    # /restaurants/:id/something
    member do
      # verb + path
      # /restaurants/:id/chef
      get 'chef'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "restaurants#index"
end
