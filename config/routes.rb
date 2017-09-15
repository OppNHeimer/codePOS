
Rails.application.routes.draw do
  resources :items do
    resources :ingredients
  end
  resources :foods
  root 'items#index'
end
