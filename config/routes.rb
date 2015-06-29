Rails.application.routes.draw do

  get 'videos/index'

  get 'videos/new'

  get 'videos/show'

  get 'videos/create'

  get 'videos/destroy'

  get 'videos/edit'

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :blogs
  resources :videos, only: [:index, :new, :create]
end
