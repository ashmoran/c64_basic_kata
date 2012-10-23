require 'spec_helper'

require 'c64_basic/parser'
require 'c64_basic/expressions'

module C64Basic
  describe Parser do
    subject(:parser)

    context "an integer" do
      example do
        expect(parser.parse("1")).to be == Expressions::IntegerExpression.new(1)
      end

      example do
        expect(parser.parse("-2")).to be == Expressions::IntegerExpression.new(-2)
      end

      example do
        expect(parser.parse(" 9 "))
      end
    end

    context "a string" do
      example do
        expect(parser.parse('"bobbins"')).to be == Expressions::StringExpression.new("bobbins")
      end

      example do
        expect(parser.parse(' "bobbins" ')).to be == Expressions::StringExpression.new("bobbins")
      end
    end

    context "a command" do
      example do
        expect(parser.parse("PRINT")).to be == Expressions::PrintCommandExpression.new
      end

      example do
        expect(parser.parse(" PRINT ")).to be == Expressions::PrintCommandExpression.new
      end
    end
  end
end