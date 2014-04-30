require "pry-debugger"
module Exercises
  # Exercise 0
  #  - Triples a given string `str`
  #  - Returns "nope" if `str` is "wishes"
  def self.ex0(str)
    if str == "wishes"
      "nope"
    else
      str * 3
    end
  end

  # Exercise 1
  #  - Returns the number of elements in the array
  def self.ex1(array)
    array.count
  end

  # Exercise 2
  #  - Returns the second element of an array
  def self.ex2(array)
    array[1]
  end

  # Exercise 3
  #  - Returns the sum of the given array of numbers
  def self.ex3(array)
    array.inject {|sum, n| sum + n}
  end

  # Exercise 4
  #  - Returns the max number of the given array
  def self.ex4(array)
    array.max
  end

  # Exercise 5
  #  - Iterates through an array and `puts` each element
  def self.ex5(array)
    array.each { |a| puts a }
  end

  # Exercise 6
  #  - Updates the last item in the array to 'panda'
  #  - If the last item is already 'panda', update
  #    it to 'GODZILLA' instead
  def self.ex6(array)
    a = array.length - 1
    if array[a] == 'panda'
      array[a] = "GODZILLA"
    else
      array[a] = 'panda'
    end
    array
  end

  # Exercise 7
  #  - If the string `str` exists in the array,
  #    add `str` to the end of the array
  def self.ex7(array, str)
    if array.include?(str)
      array.push(str)
      array
    else
      array
    end
  end

  # Exercise 8
  #  - `people` is an array of hashes. Each hash is like the following:
  #    { :name => 'Bob', :occupation => 'Builder' }
  #    Iterate through `people` and print out their name and occupation.
  def self.ex8(people)
    people.each do |hash|
      array = []
      hash.each{|key, value| array << value }
      puts "#{array[0]}, #{array[1]}"
    end
  end

  # Exercise 9
  #  - Returns `true` if the given time is in a leap year
  #    Otherwise, returns `false`
  # Hint: Google for the wikipedia article on leap years
  def self.ex9(time)
    Date.new(time).leap?
  end
end


class RPS
  # Rock, Paper, Scissors
  # Make a 2-player game of rock paper scissors. It should have the following:
  #
  # It is initialized with two strings (player names).
  # It has a `play` method that takes two strings:
  #   - Each string reperesents a player's move (rock, paper, or scissors)
  #   - The method returns the winner (player one or player two)
  #   - If the game is over, it returns a string stating that the game is already over
  # It ends after a player wins 2 of 3 games
  #
  # You will be using this class in the following class, which will let players play
  # RPS through the terminal.
  attr_accessor :player1, :player2

  def initialize
    @player1 = RPSPlayer.new
    @player2 = RPSPlayer.new
  end

  def play
    @player1.start
    @player2.start

    while player1.response == 'y' && player2.response == 'y'
      moves

      player1.restart
      player2.restart
    end

  end

  def moves
    while @player1.wins < 2 && @player2.wins < 2
      @player1.get_move
      @player2.get_move
      move1 = @player1.move
      move2 = @player2.move

      if move1 == 'rock' && move2 == 'rock' || move1 == 'paper' && move2 == 'paper' || move1 == 'scissors' && move2 == 'scissors'
        puts "#{player1.name} chose #{player1.move}!"
        puts "#{player2.name} chose #{player2.move}!"
        puts "It's a tie!"
      elsif move1 == 'rock' && move2 == 'scissors' || move1 == 'paper' && move2 == 'rock' || move1 == 'scissors' && move2 == 'paper'
        puts "#{player1.name} chose #{player1.move}!"
        puts "#{player2.name} chose #{player2.move}!"
        puts "#{player1.name} wins!"
        player1.wins += 1
        puts "#{player1.name}: #{player1.wins} wins, #{player2.name}: #{player2.wins}"
      else
        puts "#{player1.name} chose #{player1.move}!"
        puts "#{player2.name} chose #{player2.move}!"
        puts "#{player2.name} wins!"
        player2.wins += 1
        puts "#{player1.name}: #{player1.wins} wins, #{player2.name}: #{player2.wins}"
      end

      if @player1.wins == 2
        puts "#{@player1.name} is the champion of battling with mundane objects!"
      elsif @player2.wins == 2
        puts "#{@player2.name} is the champion of battling with mundane objects!"
      end
    end

  end

end


require 'io/console'
class RPSPlayer
  # (No specs are required for RPSPlayer)
  #
  # Complete the `start` method so that it uses your RPS class to present
  # and play a game through the terminal.
  #
  # The first step is to read (gets) the two player names. Feed these into
  # a new instance of your RPS class. Then `puts` and `gets` in a loop that
  # lets both players play the game.
  #
  # When the game ends, ask if the player wants to play again.
  attr_accessor :name, :move, :wins, :response

  def initialize
    @name
    @move
    @wins = 0
    @response = 'y'
  end

  def start
    puts "What is your name? "
    @name = gets.chomp
  end

  def get_move
    puts "Hello, #{@name}! Choose rock, paper, or scissors. "
    @move = STDIN.noecho(&:gets).chomp
    @move.downcase!
    if @move != 'rock' && @move != 'paper' && @move != 'scissors'
      puts "#{@name}, you must choose rock, paper or scissors"
      @move=STDIN.noecho(&:gets).chomp
    end
  end

  def restart
    @wins = 0
    puts "#{@name}, would you like to play again? y/n"
    @response = gets.chomp
    if @response != 'y' && @response != 'n'
      puts "Please respond with either 'y' or 'n' only"
      @response = gets.chomp
    end
  end

    # PRO TIP: Instead of using plain `gets` for grabbing a player's
    #          move, this line does the same thing but does NOT show
    #          what the player is typing! :D
    # This is also why we needed to require 'io/console'
    # move = STDIN.noecho(&:gets)
end


module Extensions
  # Extension Exercise
  #  - Takes an `array` of strings. Returns a hash with two keys:
  #    :most => the string(s) that occures the most # of times as its value.
  #    :least => the string(s) that occures the least # of times as its value.
  #  - If any tie for most or least, return an array of the tying strings.
  #
  # Example:
  #   result = Extensions.extremes(['x', 'x', 'y', 'z'])
  #   expect(result).to eq({ :most => 'x', :least => ['y', 'z'] })
  #
  def self.extremes(array)
    # TODO
  end
end
