Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show ]
  resources :recipes, :recipe_ingredients do
    resources :ingredients, only: [:new, :create, :edit, :update]
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
