
Rails.application.routes.draw do
  resources :categories do
    resources :items do
        post 'orders', to: 'orders#create'
      resources :includes, except: [:index, :show, :destroy] do
        delete 'destroy'
      end
    end
  end
  resources :ingredients
  resources :orders, only: [:destroy]
  root 'categories#index'
end
