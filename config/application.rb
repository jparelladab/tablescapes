require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tablescapes
  class Application < Rails::Application
    config.generators do |generate|
          generate.assets false
          generate.helper false
          generate.test_framework  :test_unit, fixture: false
        end
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

Unsplash.configure do |config|
  config.application_access_key = "c7ceeb17b69ff3b2aa57fec38d90d359861707ded3e402430bd5b8466ed9c297"
  config.application_secret = "e876f0d7c99500cca61f40349862ffcbddcaf61f294cfd5caafc337a86be3d33"
  config.application_redirect_uri = "https://tablescapes-319.herokuapp.com/"
  config.utm_source = "tablescapes"

  # optional:
  # config.logger = MyCustomLogger.new
end
