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

      its(:to_s) { should be == "(2 + 5)" }

      its(:to_ast) { should be == [ :+, 2, 5 ] }
    end
  end
end