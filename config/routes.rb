Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'home/about', to: 'home#about'

  resources :books
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
