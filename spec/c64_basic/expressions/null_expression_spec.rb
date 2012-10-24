require 'spec_helper'

require 'c64_basic/expressions'

module C64Basic
  module Expressions
    describe NullExpression do
      subject(:expression) { NullExpression.new }

      describe "#interpret" do
        specify {
          expect(expression.interpret(:unused_context)).to be_nil
        }
      end

      its(:to_s) { should be == "null" }

      describe "#==" do
        specify {
          expect(expression).to be == NullExpression.new
        }

        specify {
          # We shouldn't even be able to build this comparison object, really :-)
          expect(expression).to_not be == IntegerExpression.new(nil)
        }
      end
    end
  end
end