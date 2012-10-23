module C64Basic
  class Command
    def initialize(options)
      @filename             = options[:filename]
      @parser_factory       = options[:parser_factory]
      @interpreter_factory  = options[:interpreter_factory]
      @output               = options[:output]
      @error                = options[:error]
    end

    def run
      with_interpreter do |interpreter|
        with_parser(interpreter) do |parser|
          each_file_line do |line|
            parser.parse(line)
          end
        end
      end
    end

    private

    def with_interpreter(&block)
      yield @interpreter_factory.new(output: @output, error: @error)
    end

    def with_parser(interpreter, &block)
      yield @parser_factory.new(interpreter)
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