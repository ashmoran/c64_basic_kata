module C64Basic
  class Interpreter
    def initialize(dependencies)
      @context = {
        __io: {
          output: dependencies[:output],
          error: dependencies[:error]
        },
        __variables: Hash.new(0)
      }
    end

    def evaluate(expression)
      expression.interpret(@context)
    end
  end
end