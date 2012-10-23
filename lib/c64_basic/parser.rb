module C64Basic
  class Parser
    def parse(line)
      Expressions::IntegerExpression.new(line.to_i)
    end
  end
end