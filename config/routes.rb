
Rails.application.routes.draw do
  resources :items do
    resources :ingredients, except: [:index, :show,] do
      member do
        delete 'remove_ingredient'
      end
    end
  end
  resources :foods
  root 'items#index'

  # resources :items, only: [:index, :show] do
  #   member do
  #     post 'add_ingredient'
  #     delete 'remove_ingredient'
  #   end
  # end
end
