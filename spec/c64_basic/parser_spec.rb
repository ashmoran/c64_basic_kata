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
      @expression.to_ast
    end

    before(:each) do
      # Ugly hack to let us replace Expression equality checking with AST
      # checking without breaking the empty/blank string examples for now
      @expression =
        "nothing_parsed".tap do |no_expression|
          def no_expression.to_ast
            "nothing_parsed"
          end
        end
    end

    context "nothing" do
      example do
        parser.parse("")
        expect(expression).to be == "nothing_parsed"
      end

      example do
        parser.parse(" ")
        expect(expression).to be == "nothing_parsed"
      end
    end

    context "an integer" do
      example do
        parser.parse("1")
        expect(expression).to be == 1
      end

      example do
        parser.parse("-2")
        expect(expression).to be == -2
      end

      example do
        parser.parse(" 9 ")
        expect(expression).to be == 9
      end
    end

    context "a string" do
      example do
        parser.parse('"bobbins"')
        expect(expression).to be == "bobbins"
      end

      example do
        parser.parse(' "bobbins" ')
        expect(expression).to be == "bobbins"
      end
    end

    context "a command" do
      example do
        parser.parse("PRINT")
        expect(expression).to be == [ :print, nil ]
      end

      example do
        parser.parse(" PRINT ")
        expect(expression).to be == [ :print, nil ]
      end

      context "with an argument" do
        example do
          parser.parse("PRINT 1")
          expect(expression).to be == [ :print, 1 ]
        end

        example do
          parser.parse('PRINT "bobbins"')
          expect(expression).to be == [ :print, "bobbins" ]
        end

        example do
          parser.parse("PRINT A")
          expect(expression).to be == [ :print, [ :var, :A ] ]
        end

        example do
          parser.parse("PRINT 5 + 2")
          expect(expression).to be == [ :print, [ :+, 5, 2 ] ]
        end

        example do
          parser.parse("PRINT 5 - 2")
          expect(expression).to be == [ :print, [ :-, 5, 2] ]
        end

        example do
          parser.parse("PRINT 5 + 2 + 1")
          expect(expression).to be == [ :print, [ :+, [ :+, 5, 2 ], 1 ] ]
        end
      end
    end

    context "variable assignment" do
      example do
        parser.parse("A=1")
        expect(expression).to be == [ :assign, [ :var, :A ], 1 ]
      end
    end
  end
end