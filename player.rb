class Player
  attr_accessor :life, :turn
  def initialize
    @turn = false
    @life = 3
  end

  def lose_life
    self.life -= 1
  end

  # def switch
  #   self.turn = !self.turn
  # end

end


