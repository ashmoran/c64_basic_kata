module C64Basic
  class Interpreter
    def initialize(dependencies)
      @output = dependencies[:output]
      @error  = dependencies[:error]
    end

    def evaluate(line)
      if match = /PRINT ?(?<argument>.*)/.match(line)
        print(match[:argument])
      end
    end

    private

    def print(argument)
      case argument
      when ""
        @output.puts
      when /"([^"]*)"/
        @output.puts($1)
      when /(-?\d+)/
        @output.puts($1)
      end
    end
  end
end