require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Sw2
  class Application < Rails::Application
    config.load_defaults 6.1
    config.generators.assets = false
    config.generators.helper = false
  end
end

