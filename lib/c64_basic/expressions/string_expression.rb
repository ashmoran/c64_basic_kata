module C64Basic
  module Expressions
    class StringExpression
      def initialize(value)
        @value = value
      end

      def interpret(context)
        @value
      end

      def ==(other)
        other.is_a?(StringExpression) && other.has_string_value?(@value)
      end

      def to_s
        @value.inspect
      end

      protected

      def has_string_value?(value)
        @value == value
      end
    end
  end
end