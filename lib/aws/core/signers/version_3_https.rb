# Copyright 2011-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

require 'time'

module AWS
  module Core
    module Signers
      # @api private
      class Version3Https

        # @param [CredentialProviders::Provider] credentials
        def initialize credentials
          @credentials = credentials
        end

        # @return [CredentialProviders::Provider]
        attr_reader :credentials

        # @param [Http::Request] req
        # @return [Http::Request]
        def sign req
          parts = []
          parts << "AWS3-HTTPS AWSAccessKeyId=#{credentials.access_key_id}"
          parts << "Algorithm=HmacSHA256"
          parts << "Signature=#{signature(req)}"
          req.headers['x-amzn-authorization'] = parts.join(',')
          req.headers['x-amz-security-token'] = credentials.session_token if
            credentials.session_token
          req
        end

        private

        # @param [Http::Request] req
        def signature req
          Signer.sign(credentials.secret_access_key, string_to_sign(req))
        end

        # @param [Http::Request] req
        def string_to_sign req
          req.headers['date'] ||= Time.now.httpdate
        end

      end
    end
  end
end

