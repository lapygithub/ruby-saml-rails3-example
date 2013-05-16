source 'http://rubygems.org'

# onelogin git repo
gem 'ruby-saml', :git => "git://github.com/onelogin/ruby-saml.git"
# Cal's patches to the ruby-saml gem.  Switch to the onelogin repo for production 
#gem 'ruby-saml', :git => "git://github.com/calh/ruby-saml.git", :branch => "add_idp_metadata"
#gem 'ruby-saml', :git => "git://github.com/calh/ruby-saml.git", :branch => "add_slo"
#gem 'ruby-saml', :git => "git://github.com/calh/ruby-saml.git"

gem 'therubyracer' 
#gem 'rails', '3.1.1'
gem 'rails', '3.2.12'

gem 'json'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :development, :test do
	gem 'sqlite3'
	gem 'thin'
end

group :development do
#  gem 'heroku'
#  gem 'engineyard'
end

gem 'pg', :group => :production

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.6'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'
