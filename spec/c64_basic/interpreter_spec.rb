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
      context "an empty line" do
        before(:each) { interpreter.evaluate("") }

        specify { expect(output).to be_empty }
        specify { expect(error).to be_empty }
      end

      context "PRINT" do
        before(:each) { interpreter.evaluate("PRINT") }

        specify { expect(output).to be == "\n" }
        specify { expect(error).to be_empty }
      end
    end
  end
end