require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module AppName
  class Application < Rails::Application

    #不要なファイルを生成しない
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    end
  end
end
