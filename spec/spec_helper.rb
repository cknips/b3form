ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../dummy/config/environment", __FILE__)
require "pry-rails"
require "rspec/rails"
require "capybara/rails"
require "capybara/rspec"

Dir[Rails.root.join("../support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  #config.order = "random"

  config.use_transactional_fixtures = true

  config.include ViewHelpers
end
