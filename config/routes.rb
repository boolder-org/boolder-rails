Rails.application.routes.draw do
  namespace :admin do 
	  resources :imports
	  resources :topos
	  resources :problems
	  resources :lines

	  root 'problems#index'
	end

	get 'guide', to: "guide#index"

  root 'welcome#index'
end
