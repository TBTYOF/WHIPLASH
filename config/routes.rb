Rails.application.routes.draw do
  devise_for :users
  root to: 'users#home'
  get 'home/about' => 'users#about'
  get 'home/topic' => 'users#topic'

  resources :users
  resources :blogs do
  	resource :categorys
  	resources :comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
