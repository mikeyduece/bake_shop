Rails.application.routes.draw do
  root 'users#new'
  resources :users do
    resources :recipes, :recipe_ingredients do
      resources :ingredients, only: [:new, :create, :edit, :update]
    end
  end
  
  
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post 'users/new', to: 'users#new'
end
