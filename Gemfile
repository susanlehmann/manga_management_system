source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.4.1"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", ">= 1.1.0", require: false
gem "bootstrap"
gem "bootstrap-will_paginate"
gem "breadcrumbs_on_rails"
gem "carrierwave"
gem "cancancan"
gem "ckeditor"
gem "coffee-rails", "~> 4.2"
gem "config"
gem "devise"
gem "devise-i18n"
gem "flex-slider-rails"
gem "font-awesome-rails"
gem "jbuilder", "~> 2.5"
gem "glyphicons-rails"
gem "jquery-dotdotdot-rails"
gem "jquery-rails"
gem "jquery-ui-rails"
gem "magnific-popup-rails"
gem "mini_magick"
gem "mysql2"
gem "omniauth"
gem "omniauth-facebook"
gem "omniauth-google-oauth2"
gem "owlcarousel-rails"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.0"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"
gem "will_paginate"
gem "ransack", github: "activerecord-hackery/ransack"
gem "ratyrate", github: "wazery/ratyrate"
gem "closure_tree"
gem "acts_as_votable", "~> 0.10.0"
gem "rails_emoji_picker"
gem "social-share-button"
gem "friendly_id", "~> 5.2.0", require: "friendly_id"
gem "paranoia"
gem "toastr-rails"
gem "therubyracer", platforms: :ruby
if Gem.win_platform?
  gem "wdm", ">= 0.1.0"
end
group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "dotenv-rails"
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
gem "puma", "~> 3.11"
group :test do
  gem "capybara", ">= 2.15", "< 4.0"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
