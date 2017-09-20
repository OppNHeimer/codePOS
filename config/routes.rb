
Rails.application.routes.draw do
  resources :categories, except: [:new, :show] do
    resources :items, except: [:new] do
      post 'orders', to: 'orders#create'
      resources :includes, only: [:create, :destroy] do
        post 'without', to: 'orders#without'
        delete 'remove_without', to: 'orders#remove_without'
        post 'add', to: 'orders#add'
        delete 'remove_add', to: 'orders#remove_add'
      end
    end
  end
  resources :ingredients, except: [:new, :show]
  resources :orders, only: [:destroy]
  root 'categories#index'
end
