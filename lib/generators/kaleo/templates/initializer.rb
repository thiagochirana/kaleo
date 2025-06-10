Rails.application.config.after_initialize do
  Kaleo.configure do |config|
    config.user_class = User.name # or the KlassUser.name
    config.trial_time = 7.days.from_now
    config.mailer_sender = 'no-reply@minhaapp.com'

    config.invitation_valid_for = 2.hours.from_now
  end
end
