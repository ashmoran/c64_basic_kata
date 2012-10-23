module C64Basic
  class Parser
    def parse(line)
      case line
      when /PRINT( ?.*)/
        Expressions::PrintCommandExpression.new(parse($1))
      when /(-?\d+)/
        Expressions::IntegerExpression.new($1.to_i)
      when /"([^"]*)"/
        Expressions::StringExpression.new($1)
      end
    end
  end
end