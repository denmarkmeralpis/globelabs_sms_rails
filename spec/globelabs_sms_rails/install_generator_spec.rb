require 'generator_spec'
require_relative '../spec_helper'

RSpec.describe GlobelabsSmsRails::Generators::InstallGenerator, type: :generator do   
   destination File.expand_path('../../tmp', __FILE__)
   arguments %w(install)

   before(:all) do
      prepare_destination
      run_generator
   end

   after(:all) do
      system 'rm -rf spec/tmp'
   end

   context 'creates a globelabs_sms_rails.rb initializer' do
      it { assert_file 'config/initializers/globelabs_sms_rails.rb' }
   end
end