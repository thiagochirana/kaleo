Rails.application.config.after_initialize do
  Kaleo.configure do |config|
    config.user_class = User.name # or the KlassUser.name
    config.trial_days = 14
    config.mailer_sender = 'no-reply@minhaapp.com'
  end
end
