Rails.application.routes.draw do
  resources :recipes, only: [:new, :create, :show, :index] do
    resources :ingredients, only: [:new, :create, :edit]
  end
end
