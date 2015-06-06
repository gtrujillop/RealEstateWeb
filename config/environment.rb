# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
# Set DateTime format.
#
# Set MymeType
Mime::Type.register "image/jpg", :jpg
Mime::Type.register "text/csv", :csv

