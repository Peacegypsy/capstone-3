Rails.application.routes.draw do
  resources :cards do
    collection { post :import }
  end
  root to: "cards#index"
  get "cards/index"

  resources :cards

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
