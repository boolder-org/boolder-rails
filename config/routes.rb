Rails.application.routes.draw do
  scope "/:locale", locale: /#{I18n.available_locales.join('|')}/ do
    namespace :admin do 
      resources :imports
      resources :topos
      resources :problems
      resources :lines

      root 'problems#index'
    end

    get 'guide', to: "guide#index"

    scope 'fontainebleau' do
      resources :areas, only: [:index, :show] do 
        resources :problems, only: [:index]
      end
    end

    resources :problems, only: [:show]
    resources :circuits, only: [:show]

    get 'app', to: 'pages#app', as: :app

    # apple maps redirect (apple_map_controller.js)
    get '/geojson/problem_:id', to: redirect("/%{locale}/problems/%{id}")

    get '/soon', to: 'welcome#soon', as: :soon
  end

  get '/:locale', to: 'welcome#index', locale: /#{I18n.available_locales.join('|')}/, as: :root_localized
  root to: 'welcome#root'
end
