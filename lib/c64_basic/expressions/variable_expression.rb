module C64Basic
  module Expressions
    class VariableExpression
      def initialize(name)
        @name = name
      end

      def interpret(context)
        context[:__variables][@name]
      end

      def update_context(context, options)
        context[:__variables][@name] = options[:with_value]
      end

      def to_s
        @name
      end

      def to_ast
        [ :var, @name.to_sym ]
      end
    end
  end
end