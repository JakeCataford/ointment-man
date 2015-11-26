module Listeners
  class Base
    def self.descendants
      ObjectSpace.each_object(Class).select { |klass| klass < self }
    end

    def should_respond?(message)
      message =~ self.class.matcher
    end

    def response_for(message)
      raise NotImplementedError
    end

    class << self
      attr_accessor :matcher

      def listen_for(regex)
        self.matcher = regex
      end
    end
  end
end
