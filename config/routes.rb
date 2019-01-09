Rails.application.routes.draw do
  root to: "cards#index"
  get "cards/index"
get "/cards/layout", to: "cards#layout"
  resources :cards

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
