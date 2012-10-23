module C64Basic
  module Expressions
    class PrintCommandExpression
      def initialize(argument = nil)
        @argument = argument
      end

      def ==(other)
        other.is_a?(PrintCommandExpression) && other.has_argument?(@argument)
      end

      protected

      def has_argument?(argument)
        @argument == argument
      end
    end
  end
end