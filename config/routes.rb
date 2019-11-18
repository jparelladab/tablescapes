Rails.application.routes.draw do
  devise_for :users
  # resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  # resources :owned_tablescapes
  resources :rented_tablescapes, only: [:index, :show] do
    resources :bookings, only: :create
  end
  resources :bookings, only: [:index, :show]

  # resources :owned_tablescapes, only: [:new, :create, :show, :edit, :update, :destroy] do
  #   resources :items, except: [:show]
  # end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
