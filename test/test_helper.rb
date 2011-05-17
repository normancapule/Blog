ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def image_file
    File.new(File.expand_path('test/fixtures/files/00.jpg', Rails.root), 'r')
  end

  def invalid_image_file
    File.new(File.expand_path('test/fixtures/files/invalid.jpg', Rails.root), 'r')
  end
end
