Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
  namespace :admin do
    resources :products
  end

  resources :store, only: [:index]
  resources :users

  resources :items do
    collection do
      get :add_to_cart
    end
  end

  resources :orders do
    collection do
      get :cart
      get :address
      patch :save_address
      get :payment
      patch :confirm
    end
  end

  resources :addresses  

end
