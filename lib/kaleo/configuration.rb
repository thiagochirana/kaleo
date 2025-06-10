# frozen_string_literal: true

require 'active_support/all'

module Kaleo
  class Configuration
    attr_accessor :user_class, :trial_time, :mailer_sender, :invitation_valid_for

    def initialize
      @user_class = nil
      @trial_time = 7.days.from_now
      @mailer_sender = 'no-reply@example.com'
      @invitation_valid_for = 2.hours.from_now
    end
  end
end
