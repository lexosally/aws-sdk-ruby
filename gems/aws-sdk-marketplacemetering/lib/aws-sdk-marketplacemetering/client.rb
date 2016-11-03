# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing for info on making contributions:
# https://github.com/aws/aws-sdk-ruby/blob/master/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

require 'seahorse/client/plugins/content_length.rb'
require 'aws-sdk-core/plugins/credentials_configuration.rb'
require 'aws-sdk-core/plugins/logging.rb'
require 'aws-sdk-core/plugins/param_converter.rb'
require 'aws-sdk-core/plugins/param_validator.rb'
require 'aws-sdk-core/plugins/user_agent.rb'
require 'aws-sdk-core/plugins/helpful_socket_errors.rb'
require 'aws-sdk-core/plugins/retry_errors.rb'
require 'aws-sdk-core/plugins/global_configuration.rb'
require 'aws-sdk-core/plugins/regional_endpoint.rb'
require 'aws-sdk-core/plugins/response_paging.rb'
require 'aws-sdk-core/plugins/stub_responses.rb'
require 'aws-sdk-core/plugins/signature_v4.rb'
require 'aws-sdk-core/plugins/protocols/json_rpc.rb'

Aws::Plugins::GlobalConfiguration::IDENTIFIERS << :marketplacemetering

module Aws
  module MarketplaceMetering
    class Client < Seahorse::Client::Base

      include Aws::ClientStubs

      @identifier = :marketplacemetering

      set_api(ClientApi::API)

      add_plugin(Seahorse::Client::Plugins::ContentLength)
      add_plugin(Aws::Plugins::CredentialsConfiguration)
      add_plugin(Aws::Plugins::Logging)
      add_plugin(Aws::Plugins::ParamConverter)
      add_plugin(Aws::Plugins::ParamValidator)
      add_plugin(Aws::Plugins::UserAgent)
      add_plugin(Aws::Plugins::HelpfulSocketErrors)
      add_plugin(Aws::Plugins::RetryErrors)
      add_plugin(Aws::Plugins::GlobalConfiguration)
      add_plugin(Aws::Plugins::RegionalEndpoint)
      add_plugin(Aws::Plugins::ResponsePaging)
      add_plugin(Aws::Plugins::StubResponses)
      add_plugin(Aws::Plugins::SignatureV4)
      add_plugin(Aws::Plugins::Protocols::JsonRpc)

      # @option options [required, Aws::CredentialProvider] :credentials
      #   Your AWS credentials. This can be an instance of any one of the
      #   following classes:
      #
      #   * `Aws::Credentials` - Used for configuring static, non-refreshing
      #     credentials.
      #
      #   * `Aws::InstanceProfileCredentials` - Used for loading credentials
      #     from an EC2 IMDS on an EC2 instance.
      #
      #   * `Aws::SharedCredentials` - Used for loading credentials from a
      #     shared file, such as `~/.aws/config`.
      #
      #   * `Aws::AssumeRoleCredentials` - Used when you need to assume a role.
      #
      #   When `:credentials` are not configured directly, the following
      #   locations will be searched for credentials:
      #
      #   * `Aws.config[:credentials]`
      #   * The `:access_key_id`, `:secret_access_key`, and `:session_token` options.
      #   * ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']
      #   * `~/.aws/credentials`
      #   * `~/.aws/config`
      #   * EC2 IMDS instance profile - When used by default, the timeouts are
      #     very aggressive. Construct and pass an instance of
      #     `Aws::InstanceProfileCredentails` to enable retries and extended
      #     timeouts.
      # @option options [required, String] :region
      #   The AWS region to connect to.  The configured `:region` is
      #   used to determine the service `:endpoint`. When not passed,
      #   a default `:region` is search for in the following locations:
      #
      #   * `Aws.config[:region]`
      #   * `ENV['AWS_REGION']`
      #   * `ENV['AMAZON_REGION']`
      #   * `ENV['AWS_DEFAULT_REGION']`
      #   * `~/.aws/credentials`
      #   * `~/.aws/config`
      # @option options [String] :access_key_id
      # @option options [Boolean] :convert_params (true)
      #   When `true`, an attempt is made to coerce request parameters into
      #   the required types.
      # @option options [String] :endpoint
      #   The client endpoint is normally constructed from the `:region`
      #   option. You should only configure an `:endpoint` when connecting
      #   to test endpoints. This should be avalid HTTP(S) URI.
      # @option options [Aws::Log::Formatter] :log_formatter (Aws::Log::Formatter.default)
      #   The log formatter.
      # @option options [Symbol] :log_level (:info)
      #   The log level to send messages to the `:logger` at.
      # @option options [Logger] :logger
      #   The Logger instance to send log messages to.  If this option
      #   is not set, logging will be disabled.
      # @option options [String] :profile ("default")
      #   Used when loading credentials from the shared credentials file
      #   at HOME/.aws/credentials.  When not specified, 'default' is used.
      # @option options [Integer] :retry_limit (3)
      #   The maximum number of times to retry failed requests.  Only
      #   ~ 500 level server errors and certain ~ 400 level client errors
      #   are retried.  Generally, these are throttling errors, data
      #   checksum errors, networking errors, timeout errors and auth
      #   errors from expired credentials.
      # @option options [String] :secret_access_key
      # @option options [String] :session_token
      # @option options [Boolean] :simple_json (false)
      #   Disables request parameter conversion, validation, and formatting.
      #   Also disable response data type conversions. This option is useful
      #   when you want to ensure the highest level of performance by
      #   avoiding overhead of walking request parameters and response data
      #   structures.
      #
      #   When `:simple_json` is enabled, the request parameters hash must
      #   be formatted exactly as the DynamoDB API expects.
      # @option options [Boolean] :stub_responses (false)
      #   Causes the client to return stubbed responses. By default
      #   fake responses are generated and returned. You can specify
      #   the response data to return or errors to raise by calling
      #   {ClientStubs#stub_responses}. See {ClientStubs} for more information.
      #
      #   ** Please note ** When response stubbing is enabled, no HTTP
      #   requests are made, and retries are disabled.
      # @option options [Boolean] :validate_params (true)
      #   When `true`, request parameters are validated before
      #   sending the request.
      def initialize(*args)
        super
      end

      # @!group API Operations

      # API to emit metering records. For identical requests, the API is
      # idempotent. It simply returns the metering record ID.
      # @option params [required, String] :product_code
      #   Product code is used to uniquely identify a product in AWS
      #   Marketplace. The product code should be the same as the one used
      #   during the publishing of a new product.
      # @option params [required, Time,DateTime,Date,Integer,String] :timestamp
      #   Timestamp of the hour, recorded in UTC. The seconds and milliseconds
      #   portions of the timestamp will be ignored.
      # @option params [required, String] :usage_dimension
      #   It will be one of the 'fcp dimension name' provided during the
      #   publishing of the product.
      # @option params [required, Integer] :usage_quantity
      #   Consumption value for the hour.
      # @option params [required, Boolean] :dry_run
      #   Checks whether you have the permissions required for the action, but
      #   does not make the request. If you have the permissions, the request
      #   returns DryRunOperation; otherwise, it returns UnauthorizedException.
      # @return [Types::MeterUsageResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::MeterUsageResult#metering_record_id #MeteringRecordId} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.meter_usage({
      #     product_code: "ProductCode", # required
      #     timestamp: Time.now, # required
      #     usage_dimension: "UsageDimension", # required
      #     usage_quantity: 1, # required
      #     dry_run: false, # required
      #   })
      #
      # @example Response structure
      #   resp.metering_record_id #=> String
      # @overload meter_usage(params = {})
      # @param [Hash] params ({})
      def meter_usage(params = {}, options = {})
        req = build_request(:meter_usage, params)
        req.send_request(options)
      end

      # @!endgroup

      # Polls an API operation until a resource enters a desired state.
      #
      # ## Basic Usage
      #
      # A waiter will call an API operation until:
      #
      # * It is successful
      # * It enters a terminal state
      # * It makes the maximum number of attempts
      #
      # In between attempts, the waiter will sleep.
      #
      #    # polls in a loop, sleeping between attempts
      #    client.waiter_until(waiter_name, params)
      #
      # ## Configuration
      #
      # You can configure the maximum number of polling attempts, and the
      # delay (in seconds) between each polling attempt. You can pass
      # configuration as the final arguments hash.
      #
      #     # poll for ~25 seconds
      #     client.wait_until(waiter_name, params, {
      #       max_attempts: 5,
      #       delay: 5,
      #     })
      #
      # ## Callbacks
      #
      # You can be notified before each polling attempt and before each
      # delay. If you throw `:success` or `:failure` from these callbacks,
      # it will terminate the waiter.
      #
      #     started_at = Time.now
      #     client.wait_until(waiter_name, params, {
      #
      #       # disable max attempts
      #       max_attempts: nil,
      #
      #       # poll for 1 hour, instead of a number of attempts
      #       before_wait: -> (attempts, response) do
      #         throw :failure if Time.now - started_at > 3600
      #       end
      #     })
      #
      # ## Handling Errors
      #
      # When a waiter is unsuccessful, it will raise an error.
      # All of the failure errors extend from
      # {Aws::Waiters::Errors::WaiterFailed}**.
      #
      #     begin
      #       client.wait_until(...)
      #     rescue Aws::Waiters::Errors::WaiterFailed
      #       # resource did not enter the desired state in time
      #     end
      #
      # @param [Symbol] waiter_name The name of the waiter.
      #   Must be one of the following:
      #
      #
      #
      # @param [Hash] params A hash of request parameters to send to the
      #   operation. The following list links to the operation called by
      #   the named waiter.
      #
      #
      #
      # @yieldparam [Waiters::Waiter] waiter Yields a {Waiters::Waiter Waiter}
      #   object that can be configured prior to waiting.
      #
      # @raise [Errors::FailureStateError] Raised when the waiter terminates
      #   because the waiter has entered a state that it will not transition
      #   out of, preventing success.
      #
      # @raise [Errors::TooManyAttemptsError] Raised when the configured
      #   maximum number of attempts have been made, and the waiter is not
      #   yet successful.
      #
      # @raise [Errors::UnexpectedError] Raised when an error is encounted
      #   while polling for a resource that is not expected.
      #
      # @raise [Errors::NoSuchWaiterError] Raised when you request to wait
      #   for an unknown state.
      #
      # @return [Boolean] Returns `true` if the waiter was successful.
      # @param [Symbol] waiter_name
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      # @option options [Integer] :max_attempts
      # @option options [Integer] :delay
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def wait_until(waiter_name, params = {}, options = {})
        w = waiter(waiter_name, options)
        yield(w.waiter) if block_given? # deprecated
        w.wait(params)
      end

      # @api private
      # @deprecated
      def waiter_names
        waiters.keys
      end

      private

      # @param [Symbol] waiter_name
      # @param [Hash] options ({})
      def waiter(waiter_name, options = {})
        waiter_class = waiters[waiter_name]
        if waiter_class
          waiter_class.new(options.merge(client: self))
        else
          raise Aws::Waiters::Errors::NoSuchWaiterError.new(waiter_name, waiters.keys)
        end
      end

      def waiters
        {}
      end

      # @api private
      class << self

        # @api private
        attr_reader :identifier

        def errors_module
          Errors
        end

      end
    end
  end
end