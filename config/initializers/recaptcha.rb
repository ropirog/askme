Recaptcha.configure do |config|
  config.site_key  = ENV['RECAPTCHA_ASKME_PUBLIC_KEY']
  config.secret_key = ENV['RECAPTCHA_ASKME_SECRET_KEY']
end
