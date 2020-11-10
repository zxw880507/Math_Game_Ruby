class Question
  attr_reader :num1, :num2
  def initialize
  @num1 = rand(1..20)
  @num2 = rand(1..20)
  end

  def query
    "What does #{num1} plus #{num2} equal?"
  end

  def check_answer(answer)
    if answer == num1 + num2
      true
    else
      false
    end

  end 

end


