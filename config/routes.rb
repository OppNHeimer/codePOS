
Rails.application.routes.draw do
  resources :categories do
    resources :items do
      resources :includes, except: [:index, :show, :destroy] do
        delete 'destroy'
      end
    end
  end
  resources :ingredients
  root 'categories#index'
end
