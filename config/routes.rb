Rails.application.routes.draw do
  namespace :admin do 
	  resources :imports
	  resources :topos
	  resources :problems
	  resources :lines

	  root 'problems#index'
	end

	get 'guide', to: "guide#index"

	resources :areas, only: [:index, :show] do 
		resources :problems, only: [:index, :show]
	end

	resources :circuits, only: [:show]

  root 'welcome#index'
end
