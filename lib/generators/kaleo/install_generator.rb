require 'rails/generators'

module Kaleo
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def create_initializer_file
        template 'initializer.rb', 'config/initializers/kaleo.rb'
      end
    end
  end
end
