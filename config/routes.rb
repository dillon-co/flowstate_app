Rails.application.routes.draw do
  get 'blogs/index'

  get 'blogs/show'

  get 'blogs/new'

  get 'blogs/edit'

  get 'blogs/show'

  get 'blogs/index'

  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :blogs
end
