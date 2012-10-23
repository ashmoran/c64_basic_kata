module C64Basic
  module Expressions
    class PrintCommandExpression
      def ==(other)
        other.is_a?(PrintCommandExpression)
      end
    end
  end
end