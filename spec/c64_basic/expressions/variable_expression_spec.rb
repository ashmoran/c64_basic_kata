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

      its(:to_s) { should be == "X" }

      its(:to_ast) { should be == [ :var, :X ] }

      describe "#update_context" do
        it "should description" do
          expression.update_context(context, with_value: 2)
          expect(context[:__variables]["X"]).to be == 2
        end
      end
    end
  end
end