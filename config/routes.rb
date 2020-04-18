Rails.application.routes.draw do
  get 'welcome/index'
  resources :imports

  root 'welcome#index'
end
