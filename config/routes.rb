Rails.application.routes.draw do

  resources :users do
    resources :recipes, :recipe_ingredients do
      resources :ingredients, only: [:new, :create, :edit, :update]
    end
  end
  
  
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
