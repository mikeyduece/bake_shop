Rails.application.routes.draw do
  resources :recipes do
    resources :ingredients, only: [:new, :create]
  end
end
