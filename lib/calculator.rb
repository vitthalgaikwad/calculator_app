class Calculator

  def initialize(expression)
    @expression = expression
  end

  def valid_expression?
    re = /^\s*-?\d+(?:\s*[-+*\/]\s*\d+)+$/m
    !@expression.match(re).nil?
  end

  def operands
    @expression.scan(/\d+/)
  end

  def operators
    @expression.scan(/[+\-*\/]/)
  end

  def evaluate
    if valid_expression?
      expression = []
      operands.length.times do |i|
        expression << operands[i]
        expression << operators[i]
      end
      expression.compact!
      calc(expression).map{ |e| e.to_f }.inject(:+)
    else
      'Invalid Expression'
    end
  end

  def calc(expression)
    ['/', '*', "-", '+'].each do |opr|
      if expression.include?(opr)
        begin
          ind = expression.index(opr).to_i
          ele = (expression[ind - 1].to_f.send(opr.to_s,expression[ind + 1].to_f)).to_f
          expression[ind.to_i - 1] = ele
          expression.delete_at(ind)
          expression.delete_at(ind)
          expression = calc1(expression) if expression.include?(opr)
        rescue
          next
        end
      end
    end
    expression
  end
end