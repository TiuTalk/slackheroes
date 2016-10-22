Jumpup::Heroku.configure do |config|
  config.app = 'betterleite'
end if Rails.env.development?
