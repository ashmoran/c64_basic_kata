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
        expression.should_receive(:interpret).with(
          __io: { output: output_io, error: error_io },
          __variables: { }
        )
        interpreter.evaluate(expression)
      end

      it "defaults variables to 0" do
        expression.should_receive(:interpret) do |context|
          expect(context[:__variables]["A"]).to be == 0
        end
        interpreter.evaluate(expression)
      end
    end
  end
end