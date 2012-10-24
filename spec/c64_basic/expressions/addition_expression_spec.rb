require 'spec_helper'

require 'c64_basic/expressions'

module C64Basic
  module Expressions
    describe AdditionExpression do
      subject(:expression) {
        AdditionExpression.new(
          IntegerExpression.new(2), IntegerExpression.new(5)
        )
      }

      describe "#interpret" do
        example do
          expect(expression.interpret(:unused_context)).to be == 7
        end
      end

      describe "#==" do
        specify {
          expect(expression).to be ==
            AdditionExpression.new(
              IntegerExpression.new(2), IntegerExpression.new(5)
            )
        }

        specify {
          expect(expression).to_not be ==
            AdditionExpression.new(
              IntegerExpression.new(3), IntegerExpression.new(5)
            )
        }

        specify {
          expect(expression).to_not be ==
            AdditionExpression.new(
              IntegerExpression.new(2), IntegerExpression.new(6)
            )
        }
      end
    end
  end
end