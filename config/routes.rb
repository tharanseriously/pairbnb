Rails.application.routes.draw do
  root "home#index"
  get "/tags/:tag", to: 'listings#index', as: :tag
  resources :users, only: [:new, :create, :edit, :show]
  resources :listings, only:[:new, :create, :edit, :index, :update]

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get '/auth/failure', :to => 'sessions#failure'
end
