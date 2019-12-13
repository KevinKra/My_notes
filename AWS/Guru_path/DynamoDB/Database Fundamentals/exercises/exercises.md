# SQL Exercises

- Create a DB

## Environment Setup

### Create: Rails App

`rails new <title> -T --database=postgresql --skip-spring --skip-turbolinks`

### Setup: RSpec

```
// Gemfile
group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'pry'
  gem 'simplecov'
end
```

`bundle install`

`rails g rspec:install`


### Setup: SimpleCov

```
//top of rails_helper.rb
require 'simplecov'
SimpleCov.start
```

### Setup: ShouldaMatchers

Add gem `'shoulda-matchers', '~> 3.1'` to group `:development, :test` in your Gemfile

`bundle install`

```
// rails_helper.rb
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```

## Exercises
#### GOALS
- master active record
- master raw sql commands
- master SQL databases

#### Steps
- Create Rails API for Palette Picker