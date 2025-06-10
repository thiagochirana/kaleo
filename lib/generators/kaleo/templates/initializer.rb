Rails.application.config.after_initialize do
  Kaleo.configure do |config|
    config.user_class = User # or the KlassUser
    config.trial_time = 7.days
    config.mailer_sender = 'no-reply@minhaapp.com'

    config.invitation_valid_for = 2.hours
  end
end
