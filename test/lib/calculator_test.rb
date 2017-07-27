require 'test_helper'
require 'calculator'
class CalculatorTest < ActiveSupport::TestCase

  def test_invalid_expression
    calc = Calculator.new('4+2*4/2*')
    assert_equal calc.valid_expression?, false
  end

  def test_valid_expression
    calc = Calculator.new('4+2*4/2')
    assert calc.valid_expression?
  end

  def test_correct_calculation
    calc = Calculator.new('4+2*4/2')
    assert_equal calc.evaluate, 8
  end

  def test_operands
    calc = Calculator.new('4+2*4/2')
    assert_equal calc.operands, ['4', '2', '4', '2']
  end

  def test_operators
    calc = Calculator.new('4+2*4/2')
    assert_equal calc.operators, ['+', '*', '/']
  end
end