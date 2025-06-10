module Kaleo
  class Railtie < ::Rails::Railtie
    initializer 'kaleo.configure' do
      Kaleo.configuration ||= Kaleo::Configuration.new
    end
  end
end
