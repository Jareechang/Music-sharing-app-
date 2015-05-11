Rails.application.routes.draw do
  # initial setup needs to be changed later

  root 'static_pages#home'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]

  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  # Routes for handling the tracks resources 
  get 'tracks' => 'tracks#add_tracks'
end
