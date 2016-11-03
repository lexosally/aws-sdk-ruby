# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing for info on making contributions:
# https://github.com/aws/aws-sdk-ruby/blob/master/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws
  module AutoScaling
    module Waiters
      class GroupExists

        # @option options [required, Client] :client
        # @option options [Integer] :max_attempts (10)
        # @option options [Integer] :delay (5)
        # @option options [Proc] :before_attempt
        # @option options [Proc] :before_wait
        def initialize(options = {})
          @client = options[:client]
          @waiter = Aws::Waiters::Waiter.new({
            max_attempts: 10,
            delay: 5,
            poller: Aws::Waiters::Poller.new(
              operation_name: :describe_auto_scaling_groups,
              acceptors: [
                {
                  "argument" => "length(auto_scaling_groups) > `0`",
                  "expected" => true,
                  "matcher" => "path",
                  "state" => "success"
                },
                {
                  "argument" => "length(auto_scaling_groups) > `0`",
                  "expected" => false,
                  "matcher" => "path",
                  "state" => "retry"
                }
              ]
            )
          }.merge(options))
        end

        # @option (see Client#describe_auto_scaling_groups)
        # @return (see Client#describe_auto_scaling_groups)
        def wait(params = {})
          @waiter.wait(client: @client, params: params)
        end

        # @api private
        attr_reader :waiter

      end

      class GroupInService

        # @option options [required, Client] :client
        # @option options [Integer] :max_attempts (40)
        # @option options [Integer] :delay (15)
        # @option options [Proc] :before_attempt
        # @option options [Proc] :before_wait
        def initialize(options = {})
          @client = options[:client]
          @waiter = Aws::Waiters::Waiter.new({
            max_attempts: 40,
            delay: 15,
            poller: Aws::Waiters::Poller.new(
              operation_name: :describe_auto_scaling_groups,
              acceptors: [
                {
                  "argument" => "contains(auto_scaling_groups[].[length(instances[?lifecycle_state=='InService']) >= min_size][], `false`)",
                  "expected" => false,
                  "matcher" => "path",
                  "state" => "success"
                },
                {
                  "argument" => "contains(auto_scaling_groups[].[length(instances[?lifecycle_state=='InService']) >= min_size][], `false`)",
                  "expected" => true,
                  "matcher" => "path",
                  "state" => "retry"
                }
              ]
            )
          }.merge(options))
        end

        # @option (see Client#describe_auto_scaling_groups)
        # @return (see Client#describe_auto_scaling_groups)
        def wait(params = {})
          @waiter.wait(client: @client, params: params)
        end

        # @api private
        attr_reader :waiter

      end

      class GroupNotExists

        # @option options [required, Client] :client
        # @option options [Integer] :max_attempts (40)
        # @option options [Integer] :delay (15)
        # @option options [Proc] :before_attempt
        # @option options [Proc] :before_wait
        def initialize(options = {})
          @client = options[:client]
          @waiter = Aws::Waiters::Waiter.new({
            max_attempts: 40,
            delay: 15,
            poller: Aws::Waiters::Poller.new(
              operation_name: :describe_auto_scaling_groups,
              acceptors: [
                {
                  "argument" => "length(auto_scaling_groups) > `0`",
                  "expected" => false,
                  "matcher" => "path",
                  "state" => "success"
                },
                {
                  "argument" => "length(auto_scaling_groups) > `0`",
                  "expected" => true,
                  "matcher" => "path",
                  "state" => "retry"
                }
              ]
            )
          }.merge(options))
        end

        # @option (see Client#describe_auto_scaling_groups)
        # @return (see Client#describe_auto_scaling_groups)
        def wait(params = {})
          @waiter.wait(client: @client, params: params)
        end

        # @api private
        attr_reader :waiter

      end
    end
  end
end