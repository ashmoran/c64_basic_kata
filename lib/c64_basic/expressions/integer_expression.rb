module C64Basic
  module Expressions
    class IntegerExpression
      def initialize(value)
        @value = value
      end

      def ==(other)
        other.has_integer_value?(@value)
      end

      protected

      def has_integer_value?(value)
        @value == value
      end
    end
  end
end