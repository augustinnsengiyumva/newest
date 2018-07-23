Rails.application.routes.draw do

  get 'sessions/new'

 resources :blogs
 post 'blogs/new'
 get 'blogs/index'
 resources :users, only: [:new, :create, :show]
 resources :blogs, only: [:new, :create, :edit, :destroy]
 resources :sessions, only: [:new, :create, :edit, :destroy]
  resources :users
   root to: 'sessions#new'
  resources :blogs
  
 
 
 # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
