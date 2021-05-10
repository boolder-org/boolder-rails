require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiqq"

  scope "/:locale", locale: /#{I18n.available_locales.join('|')}/ do
    namespace :admin do 
      resources :areas do
        resources :problems, only: :index
      end
      resources :problems, except: :index
      resources :imports
      resources :topos
      resources :problem_imports
      resources :lines
      resources :pois

      root 'areas#index'
    end

    scope "articles" do
      get 'equipment', to: "articles#equipment", as: :equipment
      get 'choose-area', to: "articles#choose_area", as: :choose_area
      root to: "articles#index", as: :articles
    end

    scope 'fontainebleau' do
      resources :areas, only: [:index, :show] do 
        resources :problems, only: [:index]
        member { get 'map' }
      end
    end

    resources :problems, only: [:show]

    get 'app', to: 'pages#app', as: :app
    get 'privacy', to: 'pages#privacy', as: :privacy

    # apple maps redirect (apple_map_geojson_controller.js)
    get '/geojson/problem_:id', to: redirect("/%{locale}/problems/%{id}")
  end

  get '/:locale', to: 'welcome#index', locale: /#{I18n.available_locales.join('|')}/, as: :root_localized
  root to: 'welcome#root'
end
