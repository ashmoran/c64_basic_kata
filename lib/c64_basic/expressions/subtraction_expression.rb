module C64Basic
  module Expressions
    class SubtractionExpression
      def initialize(left_expression, right_expression)
        @left_expression  = left_expression
        @right_expression = right_expression
      end

      def interpret(context)
        @left_expression.interpret(context) - @right_expression.interpret(context)
      end

      def to_s
        "(#{@left_expression} - #{@right_expression})"
      end

      def to_ast
        [ :-, @left_expression.to_ast, @right_expression.to_ast ]
      end
    end
  end
end