# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
  ActionDispatch::IntegrationTest.fixture_path = ActiveSupport::TestCase.fixture_path
  ActiveSupport::TestCase.fixtures :all
end

module TestAssertion
  def assert_invalid(model, key)
    assert model.invalid?
    assert model.errors.has_key?(key)
  end
end

module RandomData
  def random_string(length = 8)
    o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
    (0...length).map { o[rand(o.length)] }.join
  end

  def random_datetime(options)
    datetime_to_modify = options[:after] || options[:before] || Time.zone.now
    operation = before_or_after?(options) ? add_or_remove_operation(options) : random_add_or_remove
    datetime_to_modify.send(operation, days_to_add_or_remove(options))
  end

  private

  def before_or_after?(options)
    (options[:after] || options[:before]).present?
  end

  def before_and_after?(options)
    options[:after].present? && options[:before].present?
  end

  def add_or_remove_operation(options)
    options[:after] ? :+ : :-
  end

  def random_add_or_remove
    rand(2) == 0 ? :+ : :-
  end

  def days_to_add_or_remove(options)
    before_and_after?(options) ? days_between(options[:after], options[:before]) : rand(365 + 1)
  end

  def days_between(min_date, max_date)
    (max_date - min_date).to_i / (24 * 60 * 60)
  end
end

module TestData
  include RandomData

  def create_offer(attributes = {})
    Core::Offer.create!(offer_attributes.merge(attributes))
  end

  def offer_attributes
    {
      ref: random_string,
      name: random_string,
      discount_value: rand(10),
      discount_level: rand(2),
      started_at: random_datetime(after: Time.zone.now + 1.day, before: Time.zone.now + 10.days),
      ended_at: random_datetime(after: Time.zone.now + 10.days, before: Time.zone.now + 30.days),
      expired_at: random_datetime(after: Time.zone.now + 30.days),
      retailers: [create_retailer, create_retailer]
    }
  end

  def create_retailer(attributes = {})
    Core::Retailer.create!(retailer_attributes.merge(attributes))
  end

  def retailer_attributes
    {
      ref: random_string
    }
  end
end
