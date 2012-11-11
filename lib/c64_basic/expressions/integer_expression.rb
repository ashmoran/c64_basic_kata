module C64Basic
  module Expressions
    class IntegerExpression
      def initialize(value)
        @value = value
      end

      def interpret(context)
        @value
      end

      def to_s
        @value.to_s
      end

      def to_ast
        @value
      end
    end
  end
end