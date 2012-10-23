require 'spec_helper'

require 'c64_basic/interpreter'

module C64Basic
  describe Interpreter do
    let(:output_io) { mock(IO) }
    let(:error_io)  { mock(IO) }

    let(:expression) { mock("Expression") }

    subject(:interpreter) {
      Interpreter.new(output: output_io, error: error_io)
    }

    describe "#evaluate" do
      it "evaluates the expression" do
        expression.should_receive(:interpret).with(__io: { output: output_io, error: error_io })
        interpreter.evaluate(expression)
      end
    end
  end
end