Rails.application.routes.draw do
  resources :recipes, only: [:new, :create, :show] do
    resources :ingredients, only: [:new, :create]
  end
end
