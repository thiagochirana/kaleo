require 'rails/generators'
require 'rails/generators/migration'

module Kaleo
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('templates', __dir__)

      def create_migration_file
        @table_name = resolve_table_name
        migration_template 'add_kaleo_fields.rb.erb',
                           "db/migrate/kaleo_add_fields_to_#{@table_name}.rb"
      end

      def self.next_migration_number(dirname)
        Time.now.utc.strftime('%Y%m%d%H%M%S')
      end

      def copy_mailer_views
        directory 'views', 'app/views'
      end

      private

      def resolve_table_name
        klass = Kaleo.configuration.user_class

        if klass.is_a?(Class)
          klass.table_name
        elsif klass.is_a?(String)
          klass.constantize.table_name
        else
          raise ArgumentError, 'config.user_class deve ser uma classe model que refencia seu Usuário'
        end
      end
    end
  end
end
