ENV['RAILS_ENV'] ||= 'test'
ActiveRecord::Migration.maintain_test_schema!
require 'database_cleaner'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/spec'
DatabaseCleaner.strategy = :truncation

include FactoryGirl::Syntax::Methods
class ActiveSupport::TestCase
  DatabaseCleaner.clean
end
class MiniTest::Spec
  DatabaseCleaner.clean
  # include FactoryGirl::Syntax::Methods
end