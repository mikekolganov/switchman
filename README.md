# Switchman

Rack middleware that redirects user from site root to language prefix. Preferred language of user is determined by HTTP header "Accept-Language". Otherwise first configured language will be used for redirecting.

## Installation

Add this line to your application's Gemfile:

    gem 'switchman'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install switchman

## Usage

Connect Gem as Rack middleware.

### Middleware agruments hash

* languages: - prioritized list of languages
* except: - prefixes that not be redirected. Useful for admin path

### Rails

Add to your application.rb:

    config.middleware.insert_after(
      Rails::Rack::Logger,
      Switchman::Middleware,
      languages: %(en ru), except: %w(admin)
    )

### Sinatra

Add to your sinatra application:

    use Switchman::Middleware, languages: %(en ru), except: %w(admin)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
