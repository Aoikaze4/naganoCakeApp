Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

  get 'top', to: 'homes#top'
  get 'about', to: 'homes#about'
  root to: 'homes#top'

  namespace :admin do
    resources :customers
    resources :admins
    resources :items
    resources :genres
    resources :orders
    resources :order_items
  end

  scope module: :public do
    resources :customers
    resources :addresses
    resources :items
    resources :genres, only: [:index,:show]
    resources :cart_items
    resources :orders
    resources :order_items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
