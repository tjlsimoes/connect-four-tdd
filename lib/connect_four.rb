##############################################
##############  Connect four #################
##############################################

############ Game instructions ###############
# Basic game where each player takes turns in 
# dropping pieces into the cage.

# Cage is made up of:
#   - 7 columns;
#   - 6 rows;

# Players win if they manage to get 4 of their
# pieces consecutively in a row, column, or
# along a diagonal.


############### 23 April #####################

# How could this be implemented?

# In light of knights_travails:
# perhaps using graphs?

# In light of tic-tac-toe:
# perhaps through the transformation of arrays.

# Or perhaps a merge of the two projects is in
#              order:
# utilize the game functionalities of the
# tic-tac-toe project and fall back on the 
# graph data structure to flesh out the 
# connect four board.

# Let's follow the path drawn out by the last 
# idea.

# Every square on the connect four board will
# have 8 neighbours:
# left, right, up, down and corresponding
# diagonals.

# In graph terms that could translate to a:
# node with eight children nodes. Again.

################# Note: Board dimensions
# Connect four board has 6X7 dimensions.
# That could be translated to a map of coordinates
# with [0,0] at the downmost left corner where
# the vertical axis (y-axis) spans from 0-5 and
# the horizontal axis (x-axis) spans from 0-6.


# Various child nodes would correspond to 
# the various possible combinations of 
# +/- 1 or == for the x- and y-axis
# whilst remaining within the board limits.

# Through this approach it seems that the board
# would come to life from an individual node
# and its tree/trees.

# Which would be very pars totalis of this
# project!


# Notwithstanding, would the different way of
# thinking this problem be better?
# That is:
# considering this problem without any
# reference to graphs and nodes?

# At least: not for now.

# If I were to sketch out a high-level portrait
# of the game's functionalities, what would
# manifest itself?


############# Note: High-level game description
# - Game between two players with diferent markers.
# - Manifestation of command line board.
# - Players ought to have the possibility of
# choosing between the different columns where 
# they would like to drop down their respetive
# markers.
#    - This seems to imply that user input should
#      be limited to 1-7 with different results
#      depending on the state of each column
#      (if it already has markers or not)
# - There would have to be a permanent evaluation
#   to see if, as a result of any play, a line of
#   four identical markers would be constituted:
#   diagonally, horizontally or vertically.
#     - This perhaps with the exception of the
#       plays where there would not be any four
#       identical markers on the board.


# Somehow a graph representation of the data 
# identified still seems better.
# Perhaps the "permanent evaluation" could be
# implemented in recourse to a breadth-first-
# -search where a count would be set for each
# marker on the board.

# The question then would be: 
# Is this the best way to attempt such a 
# permanent evaluation?

# It sure doesn't sound all that time or memory
# efficient... But one has to make do with what 
# one does and sees...


# Renovated high-level game description:
# - Two (human) players with different markers.
# - Command line board: what to display?
#			- Grid of numbers? 
#     - Grid of exterior markings and only
#       column numbers?
#     - Dynamic grid, building as it goes?

# Like this?

# ----+----+----+----+----+----+----
#  1  | 2  | 3  | 4  | 5  | 6  | 7  |
# ----+----+----+----+----+----+----
#  8  | 9  | 10 | 11 | 12 | 13 | 14 |
# ----+----+----+----+----+----+----
#  15 | 16 | 17 | 18 | 19 | 20 | 21 |
# ----+----+----+----+----+----+----
#  22 | 23 | 24 | 25 | 26 | 27 | 28 |
# ----+----+----+----+----+----+----
#  29 | 30 | 31 | 32 | 33 | 34 | 35 |
# ----+----+----+----+----+----+----
#  36 | 37 | 38 | 39 | 40 | 41 | 42 |
# ----+----+----+----+----+----+----

# Or like this?

# ----+----+----+----+----+----+----
#      |    |    |    |    |    |    |
# ----+----+----+----+----+----+----
#      |    |    |    |    |    |    |
# ----+----+----+----+----+----+----
#      |    |    |    |    |    |    |
# ----+----+----+----+----+----+----
#      |    |    |    |    |    |    |
# ----+----+----+----+----+----+----
#      |    |    |    |    |    |    |
# ----+----+----+----+----+----+----
#      |    |    |    |    |    |    |
# ----+----+----+----+----+----+----
# ----+----+----+----+----+----+----
#   1  | 2  | 3  | 4  | 5  |  6 |  7 |
# ----+----+----+----+----+----+----


# Perhaps instead of defining each node
# in a system of coordinates [0-6][0-7]
# one could define each node with the 
# corresponding grid number above and 
# calculate the children nodes with 
# adjusted parameters for the variations
# verified in the x- and y-axis.

# Let's take an example, "node 24":
# Node 24's childrens:
# -8, 16; +8, 32;
# -6, 18; +6, 30;
# -7, 17; +7, 31;
# -1, 23; +1, 25;

# vars = [-8, 8, -6, 6, -7, 7, -1, 1]
 
# Perhaps the "permanent evaluation"
# could be thought in, mutatis mutandis,
# finding the number of islands present 
# in a graph...?

######## Possible printing solutions:
# def print_board
# 	board = Array.new(42)
# 	col_separator, row_separator = " | ", "----+----+----+----+----+----+----" 
# 	label_for_position = lambda{ |position| board[position] ? board[position] : position}

# 	row_for_display = lambda {|row| row.map(&label_for_position).join(col_separator)}
# 	row_positions = [[1, 2, 3, 4, 5, 6, 7], [8, 9, 10, 11, 12, 13, 14], 
# 										[15, 16, 17, 18, 19, 20, 21], [22, 23, 24, 25, 26, 27, 28],
# 										[29, 30, 31, 32, 33, 34, 35], [35, 36, 37, 38, 39, 40, 41, 42]]
# 	rows_for_display = row_positions.map(&row_for_display)
# 	# puts rows_for_display
# 	puts rows_for_display.join("\n" + row_separator + "\n")
# end

# print_board


# https://github.com/rlmoser99/ruby_TicTacToe/blob/master/lib/board.rb
# def show

# 	cells = Array (1..42)
# 	puts <<-HEREDOC
# 		 #{cells[0]} | #{cells[1]}  | #{cells[2]}
# 		----+----+----
# 		 #{cells[3]}  | #{cells[4]}  | #{cells[5]}
# 		----+----+----
# 		 #{cells[6]}  | #{cells[7]}  | #{cells[8]}
# 	HEREDOC
# end
# show



############### 24 April #####################

############# Renovate: High-level game description
# - Game between two players with diferent markers.
# - Manifestation of command line board.
# - Players ought to have the possibility of
# choosing between the different columns where
# they would like to drop down their respetive
# markers.
#    - This seems to imply that user input should
#      be limited to 1-7 with different results
#      depending on the state of each column
#      (if it already has markers or not)
# - There would have to be a permanent evaluation
#   to see if, as a result of any play, a line of
#   four identical markers would be constituted:
#   diagonally, horizontally or vertically.
#     - This perhaps with the exception of the
#       plays where there would not be any four
#       identical markers on the board.


# Since user input will have to be limited to
# column number, it might be better to think of
# each possible position on the board with a
# system of coordinates instead of singular number.

# Hence connect four will be a board of
# [1-7] on the x-axis (columns)
# [1-6] on the y-axis (rows)

# Possible x-axis variations:
# [-1, 0, 1]
# Possible y-axis variations:
# [-1, 0, 1]
# where [0, 0] would correspond to present
# position and thus should not be considered
# a child.

# Just out of curiosity, is there any way to express
# the numbers previously shown on a grid using the
# coordinates.
# Most assuredly:
# number % 7 = column number, where 0 will equal
# 						 column 7
# number / 7 = row number, where 0 will equal
#              column 1

# Let's take an example:
# [3,6], 3rd column, 6th row
# (7 * 6) - (7 - 3) = 38

# Another example: 
# [2, 5], 2nd column, 5th row
# (7 * 5) - (7 - 2) = 30

# Final example:
# [7, 4], 7th column, 4th row
# (7 * 4) - (7 - 7) = 28

# Number = (7 * row) - (7 - column)


############# Print board with numbers
# def show
# 	cells = Array (0..42)
# 	puts <<-HEREDOC
# 		------------------------------------
# 		| #{cells[1]}  | #{cells[2]}  | #{cells[3]}  | #{cells[4]}  | #{cells[5]}  | #{cells[6]}  | #{cells[7]}  |
# 		------------------------------------
# 		| #{cells[8]}  | #{cells[9]}  | #{cells[10]} | #{cells[11]} | #{cells[12]} | #{cells[13]} | #{cells[14]} |
# 		------------------------------------
# 		| #{cells[15]} | #{cells[16]} | #{cells[17]} | #{cells[18]} | #{cells[19]} | #{cells[20]} | #{cells[21]} |
# 		------------------------------------
# 		| #{cells[22]} | #{cells[23]} | #{cells[24]} | #{cells[25]} | #{cells[26]} | #{cells[27]} | #{cells[28]} |
# 		------------------------------------
# 		| #{cells[29]} | #{cells[30]} | #{cells[31]} | #{cells[32]} | #{cells[33]} | #{cells[34]} | #{cells[35]} |
# 		------------------------------------
# 		| #{cells[36]} | #{cells[37]} | #{cells[38]} | #{cells[39]} | #{cells[40]} | #{cells[41]} | #{cells[42]} |
# 		------------------------------------
# 	HEREDOC
# end
# show


# ############# Print empty board
# def show
# 	cells = []
# 	i = 0
# 	while i < 43 do
# 		if i < 10
# 			cells.push(" ") 
# 		else
# 			cells.push("  ")
# 		end
# 		i += 1
# 	end

# 	puts <<-HEREDOC
# 		------------------------------------
# 		| #{cells[1]}  | #{cells[2]}  | #{cells[3]}  | #{cells[4]}  | #{cells[5]}  | #{cells[6]}  | #{cells[7]}  |
# 		------------------------------------
# 		| #{cells[8]}  | #{cells[9]}  | #{cells[10]} | #{cells[11]} | #{cells[12]} | #{cells[13]} | #{cells[14]} |
# 		------------------------------------
# 		| #{cells[15]} | #{cells[16]} | #{cells[17]} | #{cells[18]} | #{cells[19]} | #{cells[20]} | #{cells[21]} |
# 		------------------------------------
# 		| #{cells[22]} | #{cells[23]} | #{cells[24]} | #{cells[25]} | #{cells[26]} | #{cells[27]} | #{cells[28]} |
# 		------------------------------------
# 		| #{cells[29]} | #{cells[30]} | #{cells[31]} | #{cells[32]} | #{cells[33]} | #{cells[34]} | #{cells[35]} |
# 		------------------------------------
# 		| #{cells[36]} | #{cells[37]} | #{cells[38]} | #{cells[39]} | #{cells[40]} | #{cells[41]} | #{cells[42]} |
# 		------------------------------------
# 	HEREDOC
# end
# show

############# Print empty board with columns' indications
def show
	cells = []
	i = 0
	while i < 43 do
		if i < 10
			cells.push(" ") 
		else
			cells.push("  ")
		end
		i += 1
	end

	puts <<-HEREDOC
		------------------------------------
		| #{cells[1]}  | #{cells[2]}  | #{cells[3]}  | #{cells[4]}  | #{cells[5]}  | #{cells[6]}  | #{cells[7]}  |
		------------------------------------
		| #{cells[8]}  | #{cells[9]}  | #{cells[10]} | #{cells[11]} | #{cells[12]} | #{cells[13]} | #{cells[14]} |
		------------------------------------
		| #{cells[15]} | #{cells[16]} | #{cells[17]} | #{cells[18]} | #{cells[19]} | #{cells[20]} | #{cells[21]} |
		------------------------------------
		| #{cells[22]} | #{cells[23]} | #{cells[24]} | #{cells[25]} | #{cells[26]} | #{cells[27]} | #{cells[28]} |
		------------------------------------
		| #{cells[29]} | #{cells[30]} | #{cells[31]} | #{cells[32]} | #{cells[33]} | #{cells[34]} | #{cells[35]} |
		------------------------------------
		| #{cells[36]} | #{cells[37]} | #{cells[38]} | #{cells[39]} | #{cells[40]} | #{cells[41]} | #{cells[42]} |
		------------------------------------
		------------------------------------
		| 1  | 2  | 3  | 4  | 5  | 6  | 7  |
		------------------------------------
	HEREDOC
end
show