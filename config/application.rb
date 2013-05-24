require File.expand_path('../boot', __FILE__)
require 'rails/all'
if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end
module Destroyer
  class Application < Rails::Application
    require 'destroyer/settings'
    config.assets.initialize_on_precompile = false
    config.action_mailer.default_url_options = {host: Destroyer.settings.host}
    config.generators do |g|
      g.test_framework :rspec, routing_specs: false, views: false
    end
    config.encoding = "utf-8"
    config.filter_parameters += [:password]
    config.active_support.escape_html_entities_in_json = true
    config.active_record.whitelist_attributes = true
    config.assets.enabled = true
    config.assets.version = '1.0'
    config.autoload_paths << "#{Rails.root}/lib"
  end
end
