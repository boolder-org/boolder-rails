Rails.application.routes.draw do
  scope "/:locale", locale: /#{I18n.available_locales.join('|')}/ do
    namespace :admin do 
      resources :imports
      resources :topos
      resources :problems
      resources :problem_imports
      resources :lines

      root 'problems#index'
    end

    scope "articles" do
      get 'equipment', to: "articles#equipment", as: :equipment
      get 'choose-area', to: "articles#choose_area", as: :choose_area
      root to: "articles#index", as: :articles
    end

    scope 'fontainebleau' do
      resources :areas, only: [:index, :show] do 
        resources :problems, only: [:index]
      end
    end

    resources :problems, only: [:show]
    resources :circuits, only: [:show]

    get 'app', to: 'pages#app', as: :app
    get 'privacy', to: 'pages#privacy', as: :privacy

    # apple maps redirect (apple_map_controller.js)
    get '/geojson/problem_:id', to: redirect("/%{locale}/problems/%{id}")

    get '/soon', to: 'welcome#soon', as: :soon
  end

  get '/:locale', to: 'welcome#index', locale: /#{I18n.available_locales.join('|')}/, as: :root_localized
  root to: 'welcome#root'
end
