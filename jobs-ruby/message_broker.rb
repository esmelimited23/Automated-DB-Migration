module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Hash 9337
# Hash 7318
# Hash 5232
# Hash 9415
# Hash 6709
# Hash 8820
# Hash 2480
# Hash 3235
# Hash 7900
# Hash 8064
# Hash 1885
# Hash 3168
# Hash 7393
# Hash 5303
# Hash 6229
# Hash 6304
# Hash 4145
# Hash 5806
# Hash 2078