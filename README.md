# OmniAuth Hubspot

Hubspot OAuth2 Strategy for OmniAuth.

Read the [Hubspot OAuth docs](https://developers.hubspot.com/docs/methods/oauth2/oauth2-overview) for more details:

## Installing

Add to your `Gemfile`:

```ruby
gem 'omniauth-hubspot', '~> 0.1.0', github: 'advocately/omniauth-hubspot'
```

Then `bundle install`.

## Usage

`OmniAuth::Strategies::Hubspot` is simply a Rack middleware. Read the OmniAuth docs for detailed instructions: https://github.com/intridea/omniauth.

Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :hubspot, ENV['HUBSPOT_KEY'], ENV['HUBSPOT_SECRET']
end
```

To start the authentication process with Hubspot you simply need to access `/auth/hubspot` route.

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  :provider => 'hubspot',
  :uid => '342324',
  :info => {
    :email => 'kevin.antoine@hubspot.io',
    :name => 'Kevin Antoine'
  },
  :credentials => {
    :token => 'dG9rOmNdrWt0ZjtgzzE0MDdfNGM5YVe4MzsmXzFmOGd2MDhiMfJmYTrxOtA=', # OAuth 2.0 access_token, which you may wish to store
    :expires => false
  },
  :extra => {
    :raw_info => {
      :name => 'Kevin Antoine',
      :email => 'kevin.antoine@hubspot.io',
      :type => 'admin',
      :id => '342324',
      :app => {
        :id_code => 'abc123', # Company app_id
        :type => 'app',
        :secure => true # Secure mode enabled for this app
  :timezone => "Dublin",
  :name => "ProjectMap"
      },
      :avatar => {
        :image_url => "https://static.hubspotassets.com/avatars/343616/square_128/me.jpg?1454165491"
      }
    }
  }
}
```
