Rails.application.routes.draw do
  root 'pages#home'
  get '/auth/:provider/callback', to: 'authorizations#authorize'
  get '/authorize', to: 'authorizations#authorize'
  get '/:domain', to: 'teams#show', as: 'team'

  mount Sidekiq::Web, at: '/sidekiq'
end
