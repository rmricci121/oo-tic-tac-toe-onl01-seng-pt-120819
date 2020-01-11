require 'pry'
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9 , " ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7 ],[2,5,8],[0,4,8],[6,4,2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(player)
    player.to_i-1
  end

  def move(space, token = "X")
    @board[space] = token
  end
  
  def position_taken?(player)
     !(@board[player].nil? || @board[player] == " ")
  end
  
  def valid_move?(player)
    player.between?(0,8) && !position_taken?(player)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Player, choose a space 1-9:"
    space = gets.strip
    player = input_to_index(space)
    if valid_move?(player)
    cp = current_player
      move(player, cp)
    else
      turn
    end
      display_board
  end
  
  def won?
    WIN_COMBINATIONS.any? do |combo|
     if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] 
       return combo 
     end
    end
  end
  
  def full?
    @board.all? do |space|
      space != " "
      end
  end
  
  def draw?
    !(won?) && (full?)
  end
  
  def over?
    (won?) || (draw?)
  end
  
  def winner
    WIN_COMBINATIONS.detect  do |win|
      if (@board[win[0]]) == "X" && (@board[win[1]]) == "X" && (@board[win[2]]) == "X"
        return "X"
      elsif
      (@board[win[0]]) == "O" && (@board[win[1]]) == "O" && (@board[win[2]]) == "O"
      return "O"
      else
        nil
        end
      end
    end
  
  def play
    until over? 
      turn
    end
      if won?  
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end  
  
end