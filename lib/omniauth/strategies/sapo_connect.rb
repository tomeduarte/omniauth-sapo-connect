require 'omniauth/strategies/oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class SapoConnect < OmniAuth::Strategies::OAuth
      
      option :client_options, {
          :site => 'https://id.sapo.pt',
          :request_token_path => '/oauth/request_token',
          :access_token_path => '/oauth/access_token',
          :authorize_path => "/oauth/authenticate"
        }

      uid { raw_info['userid'] }

      info do
        {
          'userid' => profile_data['userid'],
          'name' => profile_data['name'],
          'email' => profile_data['email']
        }
      end

      extra do
        { 'raw_info'  =>  raw_info  }
      end

      def raw_info
        @raw_info ||= MultiJson.decode(@access_token.get('https://services.sapo.pt/SSO/GetPublicProfile').body)
      end

      def profile_data
        @profile_data ||= raw_info['GetPublicProfileResponse']['GetPublicProfileResult']['result']
      end
    end
  end
end

OmniAuth.config.add_camelization 'sapo_connect', 'SapoConnect'
