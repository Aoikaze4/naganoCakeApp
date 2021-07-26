Rails.application.routes.draw do
  devise_for :admins, only: [:sign_in, :sing_out, :session], controllers: {sessions: 'admin/sessions'}
  devise_for :customers

  get 'top', to: 'homes#top'
  get 'about', to: 'homes#about'
  root to: 'homes#top'

  namespace :admin do
    root to: 'home#index'
    resources :customers
    resources :admins
    resources :items
    resources :genres, only:[:index, :edit, :create, :update]
    resources :orders
    resources :order_items
  end

  scope module: :public do
    resources :customers, only:[:edit, :update, :leave, :update_leave]
    get '/my_page', to: 'customers#show'
    resources :addresses
    resources :cart_items, only:[:create, :index, :destroy, :update]
    delete '/cart_items', to: 'cart_items#destroy_all'
    resources :items
    resources :genres, only: [:index,:show]
    resources :orders
    post '/orders/new', to: 'orders#confirm'
    resources :order_items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
