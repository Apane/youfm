# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Youfm::Application.initialize!
ENV['VCAP_SERVICES']