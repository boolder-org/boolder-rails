Rails.application.routes.draw do
  get 'welcome/index'
  resources :imports
  resources :topos
  resources :problems
  resources :lines

  root 'problems#index'
end
