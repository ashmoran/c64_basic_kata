module C64Basic
  class Parser
    def initialize(interpreter)
      @interpreter = interpreter
    end

    def parse(line)
      parse_line(line).tap do |expression|
        @interpreter.evaluate(expression) if expression
      end
    end

    private

    def parse_line(line)
      case line
      when /PRINT( ?.*)/
        if argument_expression = parse($1)
          Expressions::PrintCommandExpression.new(argument_expression)
        else
          Expressions::PrintCommandExpression.new
        end
      when /([[:alpha:]])=(.*)/
        Expressions::VariableAssignmentExpression.new(parse($1), parse($2))
      when /(.*)\+([^+]+)/
        Expressions::AdditionExpression.new(parse($1), parse($2))
      when /(.*)- ([^-]+)/
        Expressions::SubtractionExpression.new(parse($1), parse($2))
      when /(-?\d+)/
        Expressions::IntegerExpression.new($1.to_i)
      when /"([^"]*)"/
        Expressions::StringExpression.new($1)
      when /([[:alpha:]])/
        Expressions::VariableExpression.new($1)
      end
    end
  end
end