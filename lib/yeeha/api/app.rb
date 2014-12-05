require 'active_support/core_ext'
require 'backports'

module Yeeha::Api
  class App
    autoload :Base,     'yeeha/api/app/base'
    autoload :Endpoint, 'yeeha/api/app/endpoint'

    attr_accessor :app

    # Used to track if setup already ran.
    def self.setup?
      @setup ||= false
    end

    # Loads all endpoints.
    def self.setup
      setup! unless setup?
    end

    def self.new
      setup
      super()
    end

    def initialize
      @app = Rack::Builder.app do
        Endpoint.subclasses.each do |e|
          map(e.prefix) {run (e.new)}
        end
      end
    end

    # Rack protocol
    def call(env)
      app.call(env)
    end

    private

      def self.setup!
        load_endpoints
        @setup = true
      end

      def self.load_endpoints
        Backports.require_relative_dir 'app/endpoint'
      end
  end
end
