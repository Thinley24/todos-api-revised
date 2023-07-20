RSpec.configure do |config|
  # before the entire test suite runs, clear the test database
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # set the default database cleaning strategy to be transaction
  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  # These lines hook up database_cleaner around the beginning
  # and end of each test, telling it to execute whatever
  # cleanup strategy we selected
  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
