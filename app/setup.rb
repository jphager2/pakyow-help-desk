require 'bundler/setup'
require 'pakyow'

Pakyow::Logger.class_eval do
  unless instance_methods.include?(:old_shovel)
    alias old_shovel <<

    def <<(msg = nil, severity = :unknown)
      msg = msg.dup
      old_shovel(msg, severity)
    end

    alias :write :<<
  end
end

Pakyow::App.define do
  configure do
    Bundler.require :default, Pakyow::Config.env

    if defined?(Dotenv)
      env_path = ".env.#{Pakyow::Config.env}"
      Dotenv.load env_path if File.exist?(env_path)
      Dotenv.load
    end

    app.name = 'help-desk'

    app.db = Sequel.connect(ENV['DATABASE_URL'])
    Pakyow::App.after(:init) do
      Pakyow::Config.app.db.loggers << Pakyow.logger
    end
  end

  configure :development do
    # development config goes here
  end

  configure :production do
    # production config goes here
  end
end
