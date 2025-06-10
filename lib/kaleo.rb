# frozen_string_literal: true

require_relative 'kaleo/version'
require_relative 'kaleo/configuration'
require_relative 'kaleo/railtie'

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

      raise ArgumentError, 'config.user_class precisa ser String (classe ou nome da tabela)' unless cls.is_a?(String)

      begin
        cls.constantize
      rescue NameError
        Class.new(ActiveRecord::Base) do
          self.table_name = cls
        end
      end
    end
  end
end
