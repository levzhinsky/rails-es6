begin
 require 'sprockets/railtie'
rescue LoadError
 require 'sprockets/rails/railtie'
end

module Es6
  class Railtie < ::Rails::Railtie
    config.es6 = ActiveSupport::OrderedOptions.new

    config.assets.configure do |env|
      env.register_engine '.es6', Es6::Template
    end
  end
end