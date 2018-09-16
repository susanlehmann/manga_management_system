Rails.application.routes.draw do
  post "/rate" => "rater#create", :as => "rate"
  mount Ckeditor::Engine => "/ckeditor"
  mount ActionCable.server => "/cable"
  devise_for :users, only: :omniauth_callbacks, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    root "static_pages#home"
    get "static_pages/contact"
    get "search(/:search)", to: "searches#index", as: :search
    concern :paginatable do
      get "(page/:page)", action: :index, on: :collection, as: ''
    end
    devise_for :users, skip: :omniauth_callbacks,controller: {registrations: "registrations"}
    resources :users, only: [:show] do
      member do
        get :following
      end
    end
    resources :categories
    resources :mangas, only: [:index, :show] do
      resources :comments,only: [:create, :destroy]
      member do
        get :followers
      end
      resources :vote_mangas, only: [:create, :destroy]
      resources :chapters, only: [:show] do
        resources :votes,only: [:create,:destroy]
      end
    end
    get "/mangas/:manga_id/:chapter_id", to: "chapters#show"
    resources :authors
    resources :relationships, only: [:create, :destroy]
    resources :searches, only: :index
    resources :events, only: :index
    namespace :admin do
      root "admin#index",as: :root
      resources :categories
      resources :mangas
      resources :chapters
      resources :animes
      resources :users do
        collection do
          post :import
        end
      end
    end
  end
  match "*.path", to: redirect("/#{I18n.default_locale}/%{path}"), :via => [:get, :post]
  match "", to: redirect("/#{I18n.default_locale}"), :via => [:get, :post]
  match "*path" => redirect("/"), via: :get
end
