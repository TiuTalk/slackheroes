Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, Rails.application.secrets.slack_app_key, Rails.application.secrets.slack_app_secret, scope: 'team:read,users:read,identify,bot'
end
