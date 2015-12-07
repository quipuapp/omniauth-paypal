require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class PayPal < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = "openid"
      DEFAULT_RESPONSE_TYPE = "code"
      SANDBOX_SITE = "https://api.sandbox.paypal.com"
      SANDBOX_AUTHORIZE_URL = 'https://www.sandbox.paypal.com/webapps/auth/protocol/openidconnect/v1/authorize'

      option :client_options, {
        :site          => 'https://api.paypal.com',
        :authorize_url => 'https://www.paypal.com/webapps/auth/protocol/openidconnect/v1/authorize',
        :token_url     => '/v1/identity/openidconnect/tokenservice',
        :setup         => true
      }

      option :authorize_options, [:scope, :response_type]
      option :provider_ignores_state, true
      option :sandbox, false

      def callback_url
        full_host + script_name + callback_path # + query_string
      end

      def setup_phase
        if options.sandbox
          options.client_options[:site] = SANDBOX_SITE
          options.client_options[:authorize_url] = SANDBOX_AUTHORIZE_URL
        end
        super
      end

      def authorize_params
        super.tap do |params|
          params[:scope] ||= DEFAULT_SCOPE
          params[:response_type] ||= DEFAULT_RESPONSE_TYPE
        end
      end
    end
  end
end

OmniAuth.config.add_camelization 'paypal', 'PayPal'
