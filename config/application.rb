require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ClassSearch
  class Application < Rails::Application
    config.assets.paths << "#{Rails.root}/app/assets/templates"
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
    config.ember.app_name = "App"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Eastern Time (US & Canada)'
    config.active_record.default_timezone = :local
    #config.active_record.default_timezone = :local
    #config.active_record.default_timezone = 'UTC'
    #config.active_record.time_zone_aware_attributes = false


    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.middleware.insert_before "ActionDispatch::Static", "Rack::Cors" do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end



    ActiveModel::Serializer.setup do |config|
      config.embed = :ids
      config.include_root_in_json = true
      #config.embed_in_root = true
    end
  end
end
