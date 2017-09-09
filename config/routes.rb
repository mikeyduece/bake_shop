Rails.application.routes.draw do
  resources :recipes, :recipe_ingredients do
    resources :ingredients, only: [:new, :create, :edit, :update]
  end
end
