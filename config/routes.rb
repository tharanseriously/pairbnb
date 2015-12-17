Rails.application.routes.draw do
  root "home#index"

  resources :users, only: [:new, :edit]

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  get '/auth/failure', :to => 'sessions#failure'
end
