module C64Basic
  class Interpreter
    def initialize(dependencies)
      @output = dependencies[:output]
      @error  = dependencies[:error]
    end

    def evaluate(expression)
      expression.interpret(
        __io: { output: @output, error: @error },
        __variables: Hash.new(0)
      )
    end
  end
end