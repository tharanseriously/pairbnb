Rails.application.routes.draw do
  root "listings#index"
  get "/tags/:tag", to: 'listings#index', as: :tag

  resources :listings, only:[:new, :create, :edit, :index, :update, :show] do
  	resources :reservations, only:[:new, :create]
  end

  resources :reservations do
  	resources :checkout, only:[:new, :create]
  end

  resources :users, only:[:show, :edit, :update]

  resources :reservations, only:[:index]

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get '/auth/failure', :to => 'sessions#failure'
end
