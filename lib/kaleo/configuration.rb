# frozen_string_literal: true

module Kaleo
  class Configuration
    attr_accessor :user_class, :trial_days, :mailer_sender

    def initialize
      @user_class = 'users'
      @trial_days = 14
      @mailer_sender = 'no-reply@example.com'
    end
  end
end
