$: << File.join(File.dirname(__FILE__), '..', 'app/models/')

require 'rails/all'
require 'pry'
require 'example'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true
# Use the specified formatter
  config.formatter = :documentation
end
