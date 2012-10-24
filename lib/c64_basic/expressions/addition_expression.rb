module C64Basic
  module Expressions
    class AdditionExpression
      def initialize(left_expression, right_expression)
        @left_expression  = left_expression
        @right_expression = right_expression
      end

      def interpret(context)
        @left_expression.interpret(context) + @right_expression.interpret(context)
      end

      def ==(other)
        other.is_a?(AdditionExpression) &&
          other.has_left_expression?(@left_expression) &&
          other.has_right_expression?(@right_expression)
      end

      def to_s
        "(#{@left_expression} + #{@right_expression})"
      end

      protected

      def has_left_expression?(left_expression)
        @left_expression == left_expression
      end

      def has_right_expression?(right_expression)
        @right_expression == right_expression
      end
    end
  end
end