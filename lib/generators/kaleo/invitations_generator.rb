require 'rails/generators'

module Kaleo
  module Generators
    class InvitationsGenerator < Rails::Generators::Base
      source_root File.expand_path('templates', __dir__)

      def copy_controller
        copy_file 'controllers/invitations_controller.rb', 'app/controllers/invitations_controller.rb'
      end

      def copy_views
        directory 'views/kaleo/invitations', 'app/views/invitations'
      end
    end
  end
end
