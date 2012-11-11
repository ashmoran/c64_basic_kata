require 'spec_helper'

require 'c64_basic/expressions'

module C64Basic
  module Expressions
    describe IntegerExpression do
      subject(:expression) { IntegerExpression.new(1) }

      describe "#interpret" do
        specify {
          expect(expression.interpret(:unused_context)).to be == 1
        }
      end

      its(:to_s) { should be == "1" }

      its(:to_ast) { should be == 1 }
    end
  end
end