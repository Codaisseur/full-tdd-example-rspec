source 'https://rubygems.org'

gem 'rails', '4.2.5.1'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'devise'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
  if `uname` =~ /Darwin/
    gem 'rb-fsevent'
    gem 'terminal-notifier-guard'
  end
end

