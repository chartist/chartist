Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "landing#index"
  # root to: "home#index"
  get 'secret_homepage' => 'home#index'
  resources :dashboards, only: [:show]
  resources :charts 
end
