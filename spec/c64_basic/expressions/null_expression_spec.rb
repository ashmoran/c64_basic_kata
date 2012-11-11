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

      its(:to_ast) { should be == nil }
    end
  end
end