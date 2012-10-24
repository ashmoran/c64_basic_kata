require 'spec_helper'

require 'c64_basic/parser'
require 'c64_basic/expressions'

module C64Basic
  describe Parser do
    subject(:parser) { Parser.new(self) }

    def evaluate(expression)
      @expression = expression
    end

    def expression
      @expression
    end

    before(:each) do
      @expression = :nothing_parsed
    end

    context "nothing" do
      example do
        parser.parse("")
        expect(expression).to be == :nothing_parsed
      end

      example do
        parser.parse(" ")
        expect(expression).to be == :nothing_parsed
      end
    end

    context "an integer" do
      example do
        parser.parse("1")
        expect(expression).to be == Expressions::IntegerExpression.new(1)
      end

      example do
        parser.parse("-2")
        expect(expression).to be == Expressions::IntegerExpression.new(-2)
      end

      example do
        parser.parse(" 9 ")
        expect(expression).to be == Expressions::IntegerExpression.new(9)
      end
    end

    context "a string" do
      example do
        parser.parse('"bobbins"')
        expect(expression).to be == Expressions::StringExpression.new("bobbins")
      end

      example do
        parser.parse(' "bobbins" ')
        expect(expression).to be == Expressions::StringExpression.new("bobbins")
      end
    end

    context "a command" do
      example do
        expect(parser.parse("PRINT")).to be == Expressions::PrintCommandExpression.new
      end

      example do
        parser.parse(" PRINT ")
        expect(expression).to be == Expressions::PrintCommandExpression.new
      end

      context "with an argument" do
        example do
          parser.parse("PRINT 1")
          expect(expression).to be ==
            Expressions::PrintCommandExpression.new(
              Expressions::IntegerExpression.new(1)
            )
        end

        example do
          parser.parse('PRINT "bobbins"')
          expect(expression).to be ==
            Expressions::PrintCommandExpression.new(
              Expressions::StringExpression.new("bobbins")
            )
        end

        example do
          parser.parse("PRINT A")
          expect(expression).to be ==
            Expressions::PrintCommandExpression.new(
              Expressions::VariableExpression.new("A")
            )
        end

        example do
          parser.parse("PRINT 5 + 2")
          expect(expression).to be ==
            Expressions::PrintCommandExpression.new(
              Expressions::AdditionExpression.new(
                Expressions::IntegerExpression.new(5),
                Expressions::IntegerExpression.new(2)
              )
            )
        end

        example do
          parser.parse("PRINT 5 - 2")
          expect(expression).to be ==
            Expressions::PrintCommandExpression.new(
              Expressions::SubtractionExpression.new(
                Expressions::IntegerExpression.new(5),
                Expressions::IntegerExpression.new(2)
              )
            )
        end

        example do
          parser.parse("PRINT 5 + 2 + 1")
          expect(expression).to be ==
            Expressions::PrintCommandExpression.new(
              Expressions::AdditionExpression.new(
                Expressions::AdditionExpression.new(
                  Expressions::IntegerExpression.new(5),
                  Expressions::IntegerExpression.new(2)
                ),
                Expressions::IntegerExpression.new(1)
              )
            )
        end
      end
    end

    context "variable assignment" do
      example do
        parser.parse("A=1")
        expect(expression).to be ==
          Expressions::VariableAssignmentExpression.new(
            Expressions::VariableExpression.new("A"),
            Expressions::IntegerExpression.new(1)
          )
      end
    end
  end
end