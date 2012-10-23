require 'spec_helper'

require 'c64_basic/interpreter'

module C64Basic
  describe Interpreter do
    let(:output_io) { StringIO.new }
    let(:error_io)  { StringIO.new }

    subject(:interpreter) {
      Interpreter.new(output: output_io, error: error_io)
    }

    def output
      output_io.rewind
      output_io.read
    end

    def error
      error_io.rewind
      error_io.read
    end

    describe "#evaluate" do
      after(:each) do
        expect(error).to be_empty
      end

      context "an empty line" do
        example do
          interpreter.evaluate("")
          expect(output).to be_empty
        end
      end

      context "PRINT" do
        context "no args" do
          example do
            interpreter.evaluate('PRINT')
            expect(output).to be == "\n"
          end
        end

        context "a string literal" do
          example do
            interpreter.evaluate('PRINT "string literal"')
            expect(output).to be == "string literal\n"
          end
        end

        context "an integer" do
          example do
            interpreter.evaluate('PRINT 123')
            expect(output).to be == "123\n"
          end

          example do
            interpreter.evaluate('PRINT -3')
            expect(output).to be == "-3\n"
          end
        end
      end
    end
  end
end