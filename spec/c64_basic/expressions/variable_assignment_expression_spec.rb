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

      its(:to_s) { should be == "X=(9)" }

      its(:to_ast) { should be == [ :assign, [ :var, :X ], 9 ] }
    end
  end
end