# frozen_string_literal: true

require_relative 'kaleo/version'
require_relative 'kaleo/configuration'
require_relative 'kaleo/railtie'
require_relative 'kaleo/routes'

module Kaleo
  class << self
    attr_accessor :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def user_class
      cls = configuration.user_class

      return cls if cls.is_a?(Class)

      raise ArgumentError, 'config.user_class precisa ser a Classe que referencia User' unless cls.is_a?(String)

      cls.constantize
    end
  end
end
