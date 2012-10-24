require 'spec_helper'

require 'c64_basic/expressions'

module C64Basic
  module Expressions
    describe SubtractionExpression do
      subject(:expression) {
        SubtractionExpression.new(
          IntegerExpression.new(9), IntegerExpression.new(4)
        )
      }

      describe "#interpret" do
        example do
          expect(expression.interpret(:unused_context)).to be == 5
        end
      end

      its(:to_s) { should be == "(9 - 4)" }

      describe "#==" do
        specify {
          expect(expression).to be ==
            SubtractionExpression.new(
              IntegerExpression.new(9), IntegerExpression.new(4)
            )
        }

        specify {
          expect(expression).to_not be ==
            SubtractionExpression.new(
              IntegerExpression.new(10), IntegerExpression.new(4)
            )
        }

        specify {
          expect(expression).to_not be ==
            SubtractionExpression.new(
              IntegerExpression.new(9), IntegerExpression.new(5)
            )
        }
      end
    end
  end
end