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

      its(:to_ast) { should be == [ :-, 9, 4 ] }
    end
  end
end