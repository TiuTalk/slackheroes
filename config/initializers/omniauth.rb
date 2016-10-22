Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, '2225044068.94830150770', '6be40b5147d858bf5195bbbe6e1e1482', scope: 'team:read,users:read,identify,bot'
end
