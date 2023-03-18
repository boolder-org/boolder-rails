require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiqq"

  scope "/:locale", locale: /#{I18n.available_locales.join('|')}/ do
    namespace :admin do 
      resources :areas, param: :slug do
        resources :problems, only: :index
        resources :tasks, only: :index
      end
      resources :problems, except: :index
      resources :circuits
      resources :imports
      resources :topos
      resources :problem_imports
      resources :lines
      resources :pois
      resources :poi_routes
      get "tasks/dashboard", to: "tasks#dashboard"

      root 'areas#index'
    end

    scope "articles" do
      scope "beginners-guide" do
        get '/', to: "articles#beginners_guide", as: :beginners_guide
        get 'equipment', to: "articles#equipment", as: :equipment
        get 'choose-area', to: "articles#choose_area", as: :choose_area
        get 'choose-problems', to: "articles#choose_problems", as: :choose_problems
        get 'climb-safely', to: "articles#climb_safely", as: :climb_safely
        get 'rules', to: "articles#rules", as: :rules
      end
      scope "top-areas" do
        get '/', to: redirect("/%{locale}/fontainebleau")
        get 'level', to: redirect("/%{locale}/fontainebleau"), as: :legacy_top_areas_level # keep until end of 2023
        get 'groups', to: redirect("/%{locale}/fontainebleau"), as: :legacy_top_areas_groups # keep until end of 2023
        get 'beginner', to: redirect("/%{locale}/articles/beginners-guide/choose-area"), as: :legacy_top_areas_beginner # keep until end of 2023
        get 'train', to: "articles#top_areas_train", as: :top_areas_train
        get 'dry_fast', to: "articles#top_areas_dry_fast", as: :top_areas_dry_fast
      end
      root to: redirect("/%{locale}/articles/beginners-guide"), as: :articles
    end

    scope 'fontainebleau' do
      resources :circuits, only: [:show, :index]
      resources :problems, only: [:index]

      get "/levels", to: "areas#levels", as: :areas_levels

      get "/areas", to: redirect("/%{locale}/fontainebleau"), as: :areas_legacy # keep until ??

      get ":slug/:id", to: "problems#show", as: :area_problem, id: /\d.*/
      get ":slug/map", to: redirect('/%{locale}/map/%{slug}'), as: :map_area_legacy_redirect # keep until end of 2023
      get ":slug/problems", to: "areas#problems", as: :area_problems
      get ":slug", to: "areas#show", as: :area

      get "/", to: "areas#index", as: :areas
    end

    get 'map/top7a', to: 'map#top7a', as: :map_top7a
    get 'map(/:slug)', to: 'map#index', as: :map
    get 'app', to: 'pages#app', as: :app
    get 'privacy', to: 'pages#privacy', as: :privacy
    get 'about', to: 'pages#about', as: :about

    resources :redirects, only: :new # useful for redirects where we only know the problem_id or area_id, eg. mapbox or algolia search

    # Permalinks (don't remove!)
    get '/p/:id', to: "welcome#problem_permalink" # used by the iPhone app
  end

  namespace :api do
      namespace :v1 do
        resources :topos, only: :show
      end
    end

  get '/:locale', to: 'welcome#index', locale: /#{I18n.available_locales.join('|')}/, as: :root_localized
  root to: 'welcome#root'
end
