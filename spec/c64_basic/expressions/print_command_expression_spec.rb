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

        its(:to_s) { should be == "PRINT(null)" }

        its(:to_ast) { should be == [ :print, nil ] }
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

        its(:to_s) { should be == "PRINT(1)" }

        its(:to_ast) { should be == [ :print, 1 ] }
      end
    end
  end
end