require 'spec_helper'

require 'c64_basic/expressions'

module C64Basic
  module Expressions
    describe PrintCommandExpression do
      subject(:expression) { PrintCommandExpression.new }

      describe "#==" do
        specify {
          expect(expression).to be == PrintCommandExpression.new
        }

        specify {
          expect(expression).to_not be == IntegerExpression.new(1)
        }
      end
    end
  end
end