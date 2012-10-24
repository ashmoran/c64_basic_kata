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

      def ==(other)
        [
          other.is_a?(VariableAssignmentExpression),
          other.has_variable_expression?(@variable_expression),
          other.has_value_expression?(@value_expression)
        ].all?
      end

      protected

      def has_variable_expression?(variable_expression)
        @variable_expression == variable_expression
      end

      def has_value_expression?(value_expression)
        @value_expression == value_expression
      end
    end
  end
end