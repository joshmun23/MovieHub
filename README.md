#MovieHub by Ezequiel Lopz, Josh Munn, Jack Sy and Duncan Rose
#=============================================================
###Setting up Poltergeist
###----------------------
install phantomjs
```
brew install phantomjs
```

Gemfile:
```
group :test do
  gem 'poltergeist'
  gem 'database_cleaner'
end
```

spec/database_cleaner.rb
```
RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
```

spec/rails_helper.
```
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = false
end
```

see what is happening:
```
save_screenshot("capybara-js.png")
```
=============================================================
[![Build Status](https://travis-ci.orgDuncanRose/MovieHub.svg?branch=master)](https://travis-ci.org/DuncanRose/MovieHub) [![CodeMovieHub Climate](https://codeclimate.com/github/DuncanRose/MovieHub.png)](https://codeclimate.com/github/DuncanRose/MovieHub) [![Coverage Status](https://coveralls.io/repos/DuncanRose/MovieHub/badge.png)](https://coveralls.io/r/DuncanRose/MovieHub)
