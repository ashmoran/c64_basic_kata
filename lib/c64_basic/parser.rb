module C64Basic
  class Parser
    def parse(line)
      case line
      when /(-?\d+)/
        Expressions::IntegerExpression.new($1.to_i)
      when /"([^"]*)"/
        Expressions::StringExpression.new($1)
      when /PRINT/
        Expressions::PrintCommandExpression.new
      end
    end
  end
end