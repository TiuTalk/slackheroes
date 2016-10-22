Rails.application.routes.draw do
  root 'pages#home'
  get '/auth/:provider/callback', to: 'pages#authorize'
end
