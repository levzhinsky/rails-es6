begin
 require 'sprockets/railtie'
rescue LoadError
 require 'sprockets/rails/railtie'
end

module Es6
  class Railtie < ::Rails::Railtie
    config.es6 = ActiveSupport::OrderedOptions.new

    config.es6.map = false

    initializer :setup_es6, group: :all do |app|
      config.assets.configure do |env|
        env.register_engine '.es6', Es6::Template

        env.context_class.class_eval do
          class_attribute :es6_config
          self.es6_config = app.config.es6
        end
      end
    end
  end
end