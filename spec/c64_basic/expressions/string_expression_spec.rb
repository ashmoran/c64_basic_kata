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

      its(:to_s) { should be == '"foo"' }

      its(:to_ast) { should be == "foo" }
    end
  end
end