require 'spec_helper'

require 'c64_basic/expressions'

module C64Basic
  module Expressions
    describe PrintCommandExpression do
      context "with no arguments" do
        subject(:expression) { PrintCommandExpression.new }

        describe "#==" do
          specify {
            expect(expression).to be == PrintCommandExpression.new
          }

          specify {
            expect(expression).to_not be == IntegerExpression.new(1)
          }
        end
      end

      context "with an argument" do
        subject(:expression) {
          PrintCommandExpression.new(IntegerExpression.new(1))
        }

        describe "#==" do
          specify {
            expect(expression).to be == PrintCommandExpression.new(IntegerExpression.new(1))
          }

          specify {
            expect(expression).to_not be == PrintCommandExpression.new(IntegerExpression.new(2))
          }
        end
      end
    end
  end
end