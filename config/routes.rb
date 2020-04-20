Rails.application.routes.draw do
  get 'welcome/index'
  resources :imports
  resources :topos

  root 'welcome#index'
end
