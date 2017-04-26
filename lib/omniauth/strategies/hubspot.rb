require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class HubSpot < OmniAuth::Strategies::OAuth2
      option :name, "hubspot"

      args [:client_id, :client_secret]

      option :client_options, {
        site: 'https://api.hubapi.com',
        authorize_url: 'https://app.hubspot.com/oauth/authorize',
        token_url: 'oauth/v1/token'
      }

      uid { raw_info["user_id"] }

      info do
        prune!({
          email: raw_info["user"]
        })
      end

      def raw_info
        @raw_info ||= access_token.get("/oauth/v1/access-tokens/#{access_token.token}").parsed
      end

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end

OmniAuth.config.add_camelization 'hubspot', 'HubSpot'
