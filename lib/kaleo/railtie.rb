module Kaleo
  class Railtie < ::Rails::Railtie
    initializer 'kaleo.add_route_dsl' do
      ActiveSupport.on_load(:action_mailer) do
        Kaleo::InvitationMailer
      end

      ActionDispatch::Routing::Mapper.include Kaleo::Routes
    end
  end
end
