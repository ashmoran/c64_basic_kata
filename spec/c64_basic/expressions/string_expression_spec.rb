require 'spec_helper'

require 'c64_basic/expressions'

module C64Basic
  module Expressions
    describe StringExpression do
      subject(:expression) { StringExpression.new("foo") }

      describe "#interpret" do
        specify {
          expect(expression.interpret(:unused_context)).to be == "foo"
        }
      end

      describe "#==" do
        specify {
          expect(expression).to be == StringExpression.new("foo")
        }

        specify {
          expect(expression).to_not be == StringExpression.new("bar")
        }

        specify {
          expect(expression).to_not be == IntegerExpression.new(1)
        }
      end
    end
  end
end