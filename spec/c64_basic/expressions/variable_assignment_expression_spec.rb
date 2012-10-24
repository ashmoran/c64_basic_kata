require 'spec_helper'

require 'c64_basic/expressions'

module C64Basic
  module Expressions
    describe VariableAssignmentExpression do
      let(:context) {
        {
          __variables: { }
        }
      }

      subject(:expression) {
        VariableAssignmentExpression.new(
          VariableExpression.new("X"),
          IntegerExpression.new(9)
        )
      }

      describe "#interpret" do
        example do
          expression.interpret(context)
          expect(context[:__variables]["X"]).to be == 9
        end
      end

      describe "#==" do
        specify {
          expect(expression).to be ==
            VariableAssignmentExpression.new(
              VariableExpression.new("X"),
              IntegerExpression.new(9)
            )
        }

        specify {
          expect(expression).to_not be ==
            VariableAssignmentExpression.new(
              VariableExpression.new("Y"),
              IntegerExpression.new(9)
            )
        }

        specify {
          expect(expression).to_not be ==
            VariableAssignmentExpression.new(
              VariableExpression.new("X"),
              IntegerExpression.new(10)
            )
        }
      end
    end
  end
end