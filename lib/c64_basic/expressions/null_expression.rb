module C64Basic
  module Expressions
    # This is actually a Null Object, not really an expression that means
    # NULL in BASIC. That's probably extremely confusing. I only put this
    # in to move a conditional out from PrintCommandExpression...
    class NullExpression
      def initialize
        # Nothing
      end

      def interpret(context)
        nil
      end

      def ==(other)
        other.is_a?(NullExpression)
      end

      def to_s
        "null"
      end
    end
  end
end