module C64Basic
  module Expressions
    class PrintCommandExpression
      def initialize(argument_expression = NullExpression.new)
        @argument_expression = argument_expression
      end

      def interpret(context)
        context[:__io][:output].puts(@argument_expression.interpret(context))
      end

      def to_s
        "PRINT(#{@argument_expression})"
      end

      def to_ast
        [ :print, @argument_expression.to_ast ]
      end
    end
  end
end