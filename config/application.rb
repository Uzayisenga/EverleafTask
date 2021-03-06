require_relative 'boot'

require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Live
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Japan'
    config.active_record.default_timezone = :local
    #config.i18n.default_locale = :ja
    #config.factory_bot.definition_file_paths = ["custom/factories"]
    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       controller_specs: false,
                       request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"

    end
   end
end
