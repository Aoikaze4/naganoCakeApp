Rails.application.routes.draw do
  get 'top', to: 'homes#top'
  get 'about', to: 'homes#about'
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
