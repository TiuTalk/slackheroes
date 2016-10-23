Rails.application.routes.draw do
  root 'pages#home'

  get '/auth/:provider/callback', to: 'authorizations#authorize'
  get '/authorize', to: 'authorizations#authorize'
  mount Sidekiq::Web, at: '/sidekiq'

  resources :teams, path: '', only: [:show] do
    get :random, on: :collection
  end
end
