Avsv2::Application.routes.draw do

  devise_for :users

  resources :tasks

  root to: 'static_pages#home'

  get 'static_pages/home'

end
