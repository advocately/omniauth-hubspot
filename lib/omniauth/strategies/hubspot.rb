require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class HubSpot < OmniAuth::Strategies::OAuth2
      option :name, "hubspot"

      args [:client_id, :client_secret]

      option :client_options, {
        site: 'https://api.hubapi.com',
        authorize_url: 'https://app.hubspot.com/oauth/authorize',
        token_url: 'oauth/v1/token',
        auth_scheme: :request_body
      }

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end

OmniAuth.config.add_camelization 'hubspot', 'HubSpot'
