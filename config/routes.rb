Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'
  root 'pages#home'
  get '/auth/:provider/callback', to: 'authorizations#authorize'
  get '/authorize', to: 'authorizations#authorize'
  get '/:domain', to: 'teams#show', as: 'team'
end
