require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Fdf23
  class Application < Rails::Application
  	config.assets.initialize_on_precompile = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.active_record.time_zone_aware_types = [:datetime, :time]
    config.i18n.default_locale = :en
    config.i18n.available_locales = [:vi, :en, :ja]
    config.assets.initialize_on_precompile = false
  end
end
