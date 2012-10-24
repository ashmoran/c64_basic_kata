module C64Basic
  module Expressions
    class PrintCommandExpression
      def initialize(argument = nil)
        @argument = argument
      end

      def interpret(context)
        if @argument
          context[:__io][:output].puts(@argument.interpret(context))
        else
          context[:__io][:output].puts
        end
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