require 'spec_helper'

require 'c64_basic/command'

module C64Basic
  describe Command do
    include FakeFS::SpecHelpers

    let(:parser) { mock("Parser", parse: nil) }
    let(:parser_factory) { mock(Class, new: parser) }

    let(:interpreter) { mock("Interpreter", evaluate: nil) }
    let(:interpreter_factory) { mock(Class, new: interpreter) }

    subject(:command) {
      Command.new(
        filename:             "test_filename.c64b",
        parser_factory:       parser_factory,
        interpreter_factory:  interpreter_factory,
        output:               :output_io,
        error:                :error_io
      )
    }

    before(:each) do
      File.open("test_filename.c64b", "w") do |file|
        file.puts %w[ FOO BAR BAZ ]
      end
    end

    it "creates an Interpreter" do
      interpreter_factory.should_receive(:new).with(output: :output_io, error: :error_io)

      command.run
    end

    it "creates a Parser" do
      parser_factory.should_receive(:new).with(interpreter)

      command.run
    end

    it "sends each line of the file" do
      parser.should_receive(:parse).with("FOO").ordered
      parser.should_receive(:parse).with("BAR").ordered
      parser.should_receive(:parse).with("BAZ").ordered

      command.run
    end
  end
end