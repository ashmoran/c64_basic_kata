require 'spec_helper'

require 'c64_basic/expressions'

module C64Basic
  module Expressions
    describe PrintCommandExpression do
      let(:output_io) { StringIO.new }
      let(:error_io)  { StringIO.new }

      let(:context) {
        {
          __io: { output: output_io, error: error_io }
        }
      }

      def output
        output_io.rewind
        output_io.read
      end

      def error
        error_io.rewind
        error_io.read
      end

      context "with no arguments" do
        subject(:expression) { PrintCommandExpression.new }

        describe "#interpret" do
          example do
            expression.interpret(context)
            expect(output).to be == "\n"
          end
        end

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

        describe "#interpret" do
          example do
            expression.interpret(context)
            expect(output).to be == "1\n"
          end
        end

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