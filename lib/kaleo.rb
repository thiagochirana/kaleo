# frozen_string_literal: true

require_relative 'kaleo/version'
require_relative 'kaleo/configuration'
require_relative 'kaleo/railtie'
require_relative 'kaleo/routes'
require_relative 'kaleo/invitation_mailer'

module Kaleo
  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def invite_user(user)
      token = SecureRandom.hex(10)

      user.assign_attributes(
        invitation_token: token,
        invited_at: Time.current,
        invite_expires_at: Time.current + configuration.invitation_valid_for
      )

      if user.save
        Kaleo::InvitationMailer.invite(user).deliver_later
        true
      else
        false
      end
    end

    def user_class
      cls = configuration.user_class

      return cls if cls.is_a?(Class)

      raise ArgumentError, 'config.user_class precisa ser a Classe que referencia User' unless cls.is_a?(String)

      cls.constantize
    end
  end
end
