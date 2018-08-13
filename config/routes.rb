Rails.application.routes.draw do
  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do
    root 'static_pages#home'
    get 'static_pages/contact'
    resources :users, only: [:show]
    resources :categories
    namespace :admin do
      root "admin#index",as: :root
      resources :users,only: [:index,:destroy, :show, :update,:edit] do
        collection do
          post :import
        end
      end
    end
  end
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  match '*.path', to: redirect("/#{I18n.default_locale}/%{path}"), :via => [:get, :post]
  match '', to: redirect("/#{I18n.default_locale}"), :via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
