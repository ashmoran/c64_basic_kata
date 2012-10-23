require 'spec_helper'

require 'c64_basic/expressions'

module C64Basic
  module Expressions
    describe IntegerExpression do
      subject(:expression) { IntegerExpression.new(1) }

      describe "#==" do
        specify {
          expect(expression).to be == IntegerExpression.new(1)
        }

        specify {
          expect(expression).to_not be == IntegerExpression.new(2)
        }

        specify {
          expect(expression).to_not be == StringExpression.new("1")
        }
      end
    end
  end
end