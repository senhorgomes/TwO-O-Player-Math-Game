class Question
  def initialize
    @num1 = rand(1..20) 
    @num2 = rand(1..20) 
  end

  def check_answer(input)
    input.to_i == (@num1 + @num2)
  end

  def math_questions(player)
    puts "#{player}: What does #{@num1} plus #{@num2} equal?"
  end

end