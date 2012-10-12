Avsv2::Application.routes.draw do

  resources :tasks

  root to: 'static_pages#home'

  get 'static_pages/home'

end
