require "http"
require "./ssl"
# require "logger"
# require "colorize"
require "../version"

module Monto
    class Server
        
        def self.instance
            @@instance || = new
        end

        def self.start
            self.instance.run
        end

        def self.configure
            with self yield self.instance.settings
        end

        def run
            start
        end

        def start
            time_now = Time.now
            logger.info "#{version} "

        end

        private def version
            "Monto #{Monto::VERSION}".colorize(:light_cyan)
        end

        private def host_url
            "#{scheme}://#{settings.host}:#{settings.port}".colorize(:light_cyan).mode(:underline)
        end

        private def ssl_enabled?
            settings.ssl_key_file && settings.ssl_cert_file
        end

        private def scheme
            ssl_enabled? ? "https" : "http"
        end

        private def logger
            Monto.logger
        end

        def settings
            Monto.settings
        end
    end
end