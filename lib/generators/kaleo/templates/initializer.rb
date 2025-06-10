Kaleo.configure do |config|
  config.user_class = 'users' # or your user table name equals in schema.rb
  config.trial_days = 14
  config.mailer_sender = 'no-reply@minhaapp.com'
end
