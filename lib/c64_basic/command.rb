module C64Basic
  class Command
    def initialize(options)
      @filename             = options[:filename]
      @interpreter_factory  = options[:interpreter_factory]
      @output               = options[:output]
      @error                = options[:error]
    end

    def run
      with_interpreter do |interpreter|
        each_file_line do |line|
          interpreter.evaluate(line)
        end
      end
    end

    private

    def with_interpreter(&block)
      yield @interpreter_factory.new(output: @output, error: @error)
    end

    def each_file_line(&block)
      File.open(@filename) do |file|
        file.each do |line|
          yield line.chomp
        end
      end
    end
  end
end