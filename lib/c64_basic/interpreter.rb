module C64Basic
  class Interpreter
    def initialize(dependencies)
      @output = dependencies[:output]
      @error  = dependencies[:error]
    end

    def evaluate(line)
      @output.puts if line == "PRINT"
    end
  end
end