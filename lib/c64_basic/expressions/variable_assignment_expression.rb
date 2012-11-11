module C64Basic
  module Expressions
    class VariableAssignmentExpression
      def initialize(variable_expression, value_expression)
        @variable_expression  = variable_expression
        @value_expression     = value_expression
      end

      def interpret(context)
        @variable_expression.update_context(
          context, with_value: @value_expression.interpret(context)
        )
      end

      def to_s
        "#{@variable_expression}=(#{@value_expression})"
      end

      def to_ast
        [ :assign, @variable_expression.to_ast, @value_expression.to_ast ]
      end
    end
  end
end