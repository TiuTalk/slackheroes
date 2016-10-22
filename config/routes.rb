Rails.application.routes.draw do
  root 'pages#home'
  get '/auth/:provider/callback', to: 'authorizations#authorize'
  get '/authorize', to: 'authorizations#authorize'
end
