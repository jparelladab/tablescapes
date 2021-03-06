Rails.application.routes.draw do
  devise_for :users
  # resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  # resources :owned_tablescapes
  get '/search_results', to: 'tablescapes#search_results'
  resources :tablescapes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  #   resources :bookings, only: [:create]
  # end
  resources :tablescapes, only: [:show] do
    resources :bookings, only: [:show, :create]
    resources :reviews, only: [:show]
  end


  resources :bookings, only: [:index] do
    resources :reviews, only: [:show, :new, :create, :update, :destroy]
  end
  # resources :owned_tablescapes, only: [:new, :create, :show, :edit, :update, :destroy] do
  #   resources :items, except: [:show]
  # end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
