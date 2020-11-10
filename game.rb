
class Game
  attr_reader :number_of_players
  attr_accessor :players
  attr_writer :loser

  def initialize
    puts "Enter numbers of players: "
    @number_of_players = gets.chomp.to_i
    self.create_players
    @loser
    self.play
  end

  def create_players
    i = 0
    players = []
    while i < self.number_of_players
      player = Player.new
      players << player
      i += 1
    end
    self.players = players
  end

  def play
    while !players.index {|player| player.life == 0}

      players.each_with_index do |player, index|
        question = Question.new
        puts "Player #{index + 1}: #{question.query}"

        answer = gets.chomp.to_i
        if question.check_answer(answer)
          puts "Player #{index + 1}: You are correct."
        else
          puts "Player #{index + 1}: Seriously? No!"
          player.lose_life
          if player.life == 0
            self.loser = index
            break
          end
        end

        puts players.each_with_index.map { |player, index| "P#{index + 1}: #{player.life}/3"}.join(" vs ")
        puts "----- NEW TURN -----"

      end
      
    end
    
    players.each_with_index do | player, index |
      if self.loser != index
        puts "Player #{index + 1} wins with a score of #{player.life}/3"
      end
    end

    puts "------ GAME OVER ------"
    puts "Good Bye!"
  end  






end



