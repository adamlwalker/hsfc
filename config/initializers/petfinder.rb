Petfinder.configure do |config|
  config.api_key = Rails.application.secrets.petfinder_key
  config.api_secret = Rails.application.secrets.petfinder_secret
end
