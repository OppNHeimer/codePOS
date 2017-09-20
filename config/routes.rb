
Rails.application.routes.draw do
  resources :categories, except: [:new, :show] do
    resources :items, except: [:new] do
        post 'orders', to: 'orders#create'
      resources :includes, only: [:create, :destroy] do
        delete 'destroy'
      end
      resources :ingredients, only: [] do
        post 'add_modification', to: 'ingredients#add_modification'
      end
    end
  end
  resources :ingredients
  resources :orders, only: [:destroy]
  root 'categories#index'
end
