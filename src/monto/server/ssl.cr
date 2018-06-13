require "openssl"

module Monto
    class SSL
        def initialize(@key_file : String, @cert_file : String) 
        end

        def generate_tls
            tls = Openssl::SSL::Context::Server.new
            tls.private_key = @key_file
            tls.certificate_chain = @cert_file
            tls
        end
    end