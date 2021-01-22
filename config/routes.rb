Rails.application.routes.draw do
  get 'welcome/index'

  namespace :admin do 
	  resources :imports
	  resources :topos
	  resources :problems
	  resources :lines
	end

  root 'welcome#index'
end
