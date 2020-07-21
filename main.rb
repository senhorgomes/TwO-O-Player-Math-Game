require './players'
require './game'


P1 = Player.new('Player1')
P2 = Player.new('Player2')
@current_player = P1
# Introduces players to game
def start
  puts "WELCOME TO TWO-O-PLAYER MATH GAME!"
  puts "Ready Player1?"
  puts "Ready Player2?"
  puts "Let's start!"
end
# Check which players are still alive
def players_are_alive
  !P1.gameover && !P2.gameover
end
# Verifies if answer is correct, if not takes away one life
def check_player_answer(question, player)
  print "> "
  input = $stdin.gets.chomp
  if question.check_answer(input)
    puts "Yes! You are correct."
  else
    puts "Seriously? No!"
    player.incorrect
  end
end
# Shows current lives left
def show_stats
  puts "P1: #{P1.lives}/3 vs P2: #{P2.lives}/3"
end
# Switches player
def change_player
  if (@current_player == P1)
    @current_player = P2
  else
    @current_player = P1
  end
end

def new_turn(current_player)
  question = Question.new
  question.math_questions(current_player.name)
  check_player_answer(question, current_player)
  show_stats
  change_player
end

start
while players_are_alive
  new_turn(@current_player)
end

if P1.gameover
  puts "Player 2 wins"
else
  puts "Player 1 wins"
end
puts "---- GAMEOVER ----"
