module GlobelabsSmsRails
   class Configuration
      
      attr_writer :app_id, :app_secret, :passphrase, :short_code
  
      def initialize
        @app_id = nil
        @app_secret = nil
        @passphrase = nil
        @short_code = nil
      end

      def app_id
         raise Errors::Configuration, "Globe Labs application id missing! See documentation for configuration settings." unless @app_id
         @app_id
      end

      def app_secret
         raise Errors::Configuration, "Globe Labs application secret missing! See documentation for configuration settings." unless @app_secret
         @app_secret
      end

      def passphrase
         raise Errors::Configuration, "Globe Labs application passphrase missing! See documentation for configuration settings." unless @passphrase
         @passphrase
      end

      def short_code
         raise Errors::Configuration, "Globe Labs short code missing! See documentation for configuration settings." unless @short_code
         @short_code
      end
    end
end