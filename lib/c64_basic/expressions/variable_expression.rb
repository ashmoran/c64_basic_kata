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

      def ==(other)
        other.is_a?(VariableExpression) && other.has_name?(@name)
      end

      def to_s
        @name
      end

      protected

      def has_name?(name)
        @name == name
      end
    end
  end
end