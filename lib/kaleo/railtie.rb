module Kaleo
  class Railtie < ::Rails::Railtie
    initializer 'kaleo.add_route_dsl' do
      ActionDispatch::Routing::Mapper.include Kaleo::Routes
    end
  end
end
