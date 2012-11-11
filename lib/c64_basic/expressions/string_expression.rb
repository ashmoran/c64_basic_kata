module C64Basic
  module Expressions
    class StringExpression
      def initialize(value)
        @value = value
      end

      def interpret(context)
        @value
      end

      def to_s
        @value.inspect
      end

      def to_ast
        @value
      end
    end
  end
end