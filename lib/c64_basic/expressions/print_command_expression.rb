module C64Basic
  module Expressions
    class PrintCommandExpression
      def initialize(argument = NullExpression.new)
        @argument = argument
      end

      def interpret(context)
        context[:__io][:output].puts(@argument.interpret(context))
      end

      def ==(other)
        other.is_a?(PrintCommandExpression) && other.has_argument?(@argument)
      end

      def to_s
        "PRINT(#{@argument})"
      end

      protected

      def has_argument?(argument)
        @argument == argument
      end
    end
  end
end