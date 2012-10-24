require 'spec_helper'

require 'c64_basic/expressions'

module C64Basic
  module Expressions
    describe VariableExpression do
      subject(:expression) { VariableExpression.new("X") }

      let(:context) {
        { __variables: { "X" => 1 } }
      }

      describe "#interpret" do
        specify {
          expect(expression.interpret(context)).to be == 1
        }
      end

      describe "#update_context" do
        it "should description" do
          expression.update_context(context, with_value: 2)
          expect(context[:__variables]["X"]).to be == 2
        end
      end

      describe "#==" do
        specify {
          expect(expression).to be == VariableExpression.new("X")
        }

        specify {
          expect(expression).to_not be == VariableExpression.new("Y")
        }

        specify {
          expect(expression).to_not be == StringExpression.new("X")
        }
      end
    end
  end
end