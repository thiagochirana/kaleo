require 'rails/generators'
require 'rails/generators/migration'

module Kaleo
  module Generators
    class GenerateGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path('templates', __dir__)

      def create_migration_file
        @table_name = resolve_table_name
        migration_template 'add_kaleo_fields.rb.erb',
                           "db/migrate/add_kaleo_fields_to_#{@table_name}.rb"
      end

      def self.next_migration_number(dirname)
        Time.now.utc.strftime('%Y%m%d%H%M%S')
      end

      def copy_mailer_views
        directory 'views', 'app/views/kaleo/invitation_mailer'
      end

      private

      def resolve_table_name
        configured = Kaleo.configuration.user_class
        begin
          configured.constantize.table_name
        rescue NameError
          raise ArgumentError,
                "table #{configured.constantize.table_name} inválido. Campo config.user_class precisa ser classe ou nome da tabela válida"
        end
      end
    end
  end
end
