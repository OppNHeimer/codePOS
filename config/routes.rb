
Rails.application.routes.draw do
  resources :categories do
    resources :items do
        post 'add_to_order'
      resources :includes, except: [:index, :show, :destroy] do
        delete 'destroy'
      end
    end
  end
  resources :ingredients
  root 'categories#index'
end
