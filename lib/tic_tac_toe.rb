class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS =[
        [0,1,2], [3,4,5], [6,7,8], 
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [6,4,2]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    # accept user input
    # convert userinput to integer
    # return a number -1 user_input
    def input_to_index(user_input)
        user_input.to_i - 1
    end

    # index,token
    def move(index, token)
        @board[index] = token
    end

    # the ? at the end of the method indicates that the method returns true || false
    def position_taken?(index)
        # # method 1
        # return @board[index] !=  " "

        # method 2:using if else statements
        if @board[index] == " "
            return false
        else
            return true
        end
    end

    def valid_move?(index)
        # method 1
        !position_taken?(index) && index.between?(0,8)

    #     # if else statement
    #     if !position_taken?(index) && index.between?(0,8)
    #         return true
    #     else
    #         return false
    #     end
    end

    def turn_count
        @board.count{|square| square !=  " "}
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
       puts "Enter first move:" 
       index = input_to_index(gets.chomp)
       if valid_move?(index)
        move(index, current_player)
        display_board
       else
        turn
    end
    end

    def won?
        # Check each win combination
        WIN_COMBINATIONS.each do |combination|
          # Check if the positions in the combination are taken and have the same value on the board
          if position_taken?(combination[0]) && @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
            # Return the winning combination
            return combination
          end
        end
        # Return false if no winning combination is found
        false
      end

      def full?
        @board.all? { |position| position == "X" || position == "O" }
      end

      def draw?
        full? && !won?
      end
      
      def over?
        draw? || won?
      end
      
      def winner
        if combination = won?
          @board[combination[0]]
        end
    end

    def play
        while !over?
          display_board
          move = get_move
          update_board(move)
          switch_players
        end
    end
    
end