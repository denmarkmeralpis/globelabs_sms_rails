require 'rails/generators'

module GlobelabsSmsRails
   module Generators
      class InstallGenerator < Rails::Generators::NamedBase
         source_root File.expand_path('../templates', __FILE__)
         desc 'Creates globelabs_sms_rails.rb initializer for your application'

         def copy_initializer
            template 'globelabs_sms_rails_initializer.rb', 'config/initializers/globelabs_sms_rails.rb'

            puts "Install complete! Configure the file in config/initializers/globelabs_sms_rails.rb"
         end
      end
   end
end