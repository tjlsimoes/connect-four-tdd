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

# ############# Print empty board with columns' indications
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
# 		------------------------------------
# 		| 1  | 2  | 3  | 4  | 5  | 6  | 7  |
# 		------------------------------------
# 	HEREDOC
# end
# show


# class Game

# 	attr_reader :board, :player1, :player2, :current_player

# 	def initialize(player1, player2)
# 		@board = initial_board
# 		@player1 = HumanPlayer.new(player1, "\u26d4")
# 		@player2 = HumanPlayer.new(player2, "\u26dD")

# 		@current_player = @player1
# 	end

# 	def initial_board
# 		cells = []
# 		i = 0
# 		while i < 43 do
# 			if i < 10
# 				cells.push(" ") 
# 			else
# 				cells.push("  ")
# 			end
# 			i += 1
# 		end
# 		cells
# 	end

# 	def show
# 		puts <<-HEREDOC
# 			------------------------------------
# 			| #{board[1]}  | #{board[2]}  | #{board[3]}  | #{board[4]}  | #{board[5]}  | #{board[6]}  | #{board[7]}  |
# 			------------------------------------
# 			| #{board[8]}  | #{board[9]}  | #{board[10]} | #{board[11]} | #{board[12]} | #{board[13]} | #{board[14]} |
# 			------------------------------------
# 			| #{board[15]} | #{board[16]} | #{board[17]} | #{board[18]} | #{board[19]} | #{board[20]} | #{board[21]} |
# 			------------------------------------
# 			| #{board[22]} | #{board[23]} | #{board[24]} | #{board[25]} | #{board[26]} | #{board[27]} | #{board[28]} |
# 			------------------------------------
# 			| #{board[29]} | #{board[30]} | #{board[31]} | #{board[32]} | #{board[33]} | #{board[34]} | #{board[35]} |
# 			------------------------------------
# 			| #{board[36]} | #{board[37]} | #{board[38]} | #{board[39]} | #{board[40]} | #{board[41]} | #{board[42]} |
# 			------------------------------------
# 			------------------------------------
# 			| 1  | 2  | 3  | 4  | 5  | 6  | 7  |
# 			------------------------------------
# 		HEREDOC
# 	end
# end

# class HumanPlayer
# 	attr_reader :name, :symbol

# 	def initialize(name, symbol)
# 		@name = name
# 		@symbol = symbol
# 	end
# end

# # Game.new.show

############### 25 April #####################

# Previous print solution made a difference
# between cells with numbers of two digits
# and cells of one digit. 

# That shall not be necessary!
# Board will be initially blank and to be
# filled with one of two markers.
# Where each of the two markers will only
# occupy a single digit space.

############# Refactor print method
# def show
# 	cells = Array.new(43, " ")

# 	puts <<-HEREDOC
# 		-----------------------------
# 		| #{cells[1]} | #{cells[2]} | #{cells[3]} | #{cells[4]} | #{cells[5]} | #{cells[6]} | #{cells[7]} |
# 		-----------------------------
# 		| #{cells[8]} | #{cells[9]} | #{cells[10]} | #{cells[11]} | #{cells[12]} | #{cells[13]} | #{cells[14]} |
# 		-----------------------------
# 		| #{cells[15]} | #{cells[16]} | #{cells[17]} | #{cells[18]} | #{cells[19]} | #{cells[20]} | #{cells[21]} |
# 		-----------------------------
# 		| #{cells[22]} | #{cells[23]} | #{cells[24]} | #{cells[25]} | #{cells[26]} | #{cells[27]} | #{cells[28]} |
# 		-----------------------------
# 		| #{cells[29]} | #{cells[30]} | #{cells[31]} | #{cells[32]} | #{cells[33]} | #{cells[34]} | #{cells[35]} |
# 		-----------------------------
# 		| #{cells[36]} | #{cells[37]} | #{cells[38]} | #{cells[39]} | #{cells[40]} | #{cells[41]} | #{cells[42]} |
# 		-----------------------------
# 		-----------------------------
# 		| 1 | 2 | 3 | 4 | 5 | 6 | 7 |
# 		-----------------------------
# 	HEREDOC
# end
# show

# Let's try and organize things in reference to:
# https://github.com/rlmoser99/ruby_TicTacToe

######## How to manage user input?
# User will input a number 1-7
# Somehow the computer will have to:
# - Look at the corresponding column.
# - Understand if there is any empty
#     space on such a column
# - Place user input on the lowest available
#     space.

# 1st_row_idx = [1,8,15,22,29,36]
# 2nd_row_idx = [2, 9, 16, 23, 30, 37]
# 3rd_row_idx = [3, 10, 17, 24, 31, 38]
# 4th_row_idx = [4, 11, 18, 25, 32, 39]
# 5th_row_idx = [5, 12, 19, 26, 33, 40]
# 6th_row_idx = [6, 13, 20, 27, 34, 41]
# 7th_row_idx = [7, 14, 21, 28, 35, 42]


############### 27 April #####################

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

# Main point missing:
# "Permanent evaluation" of game_over?

# How could that be done?

# - Think of each symbol inserted into the board
#   as a node. Do a BFS with a counter to be
#   incremented for each continuous child node
#   that has the same marker/symbol?

# As of right now I have a Board class with a
# @cells instance variable.
# The @cells instance variable is initiated
# with 43 values of " ".

# Perhaps there are two ways to think about this
# problem.

# On a first perspetive, the input by the user
# could be used to create a node as immediately
# as possible. In a continuum to putting the marker
# on the designated position on the board.

# On a second perspetive, a scan through the board
# could be made to identify any markers/symbols and
# define its corresponding children nodes, that is
# that node as a tree.

# Previously identified variations to attain children
# of a node:
# vars = [-8, 8, -6, 6, -7, 7, -1, 1]

# Create a parallel array to @cells instance variable?
# Where nodes would be inputted (/replace nil values)?
# Such that the verification of game_over? would occur
# in reference to this parallel array of @cells?

# As regards to the previous two different perspetives.
# It might be the case that the two are required.
# For the following reasons.
# When a marker is inserted into the board,
# not only a node ought to be created in correspondence
# to its location, but also
# the other nodes already on the board will possible have
# to be updated.
# That is: their children will possibly have to be updated.

# Though this all seems rather inneficient, it seems necssary

# Could board show be refactored so as to board class always
# output an array of initial 43 nil values?
# It seems so, as long as in the show method nil values
# were mapped for ' ' values.

############### 28 April #####################

# class Node
#   attr_accessor :id, :child1, :child2,
#                     :child3, :child4, :child5, 
#                     :child6, :child7, :child8
#   def initialize(number)
#     @id = number
#     @child1 = nil
#     @child2 = nil
#     @child3 = nil
#     @child4 = nil
#     @child5 = nil
#     @child6 = nil
#     @child7 = nil
#     @child8 = nil
#   end

  # def children
  #   [self.child1, self.child2, self.child3, self.child4,
  #       self.child5, self.child6, self.child7, self.child8]
  # end

#   def children
#     [@child1, @child2, @child3, @child4,
#         @child5, @child6, @child7, @child8]
#   end
# end

# class NodeTree
#   attr_reader :root

#   def initialize(id, board_nodes = Board.new(true))
#     @board_nodes = board_nodes.cells
#     @root = build_tree(id, @board_nodes)
#   end

#   def build_tree(id, board_nodes)
#     return nil if !(1..42).include?(id)

#     vars = [-8, 8, -6, 6, -7, 7, -1, 1]

#     root_node = Node.new(id)

#     i = 0
#     while i < vars.length
#       case i
#       when 1
#         root_node.child1 = board_nodes[id + vars[i]]
#       when 2
#         root_node.child2 = board_nodes[id + vars[i]]
#       when 3
#         root_node.child3 = board_nodes[id + vars[i]]
#       when 4
#         root_node.child4 = board_nodes[id + vars[i]]
#       when 5
#         root_node.child5 = board_nodes[id + vars[i]]
#       when 6
#         root_node.child6 = board_nodes[id + vars[i]]
#       when 7
#         root_node.child7 = board_nodes[id + vars[i]]
#       when 8
#         root_node.child8 = board_nodes[id + vars[i]]
#       end
#       i += 1
#     end

#     root_node
#   end
# end

# require_relative "board"

# board = Board.new(true)
# board.update_board(2, Node.new(37))
# # p board
# new_tree = NodeTree.new(36, board)
# p new_tree

############### 29 April #####################

# Efforts still focused on the "permanent
# evaluation of game_over?".

# As of yesterday a Node and a NodeTree classes
# seem to have been successfully implemented.

# The question now seems to be:
# How to integrate this side of things to
# the game, to the board ?

# How does the game progress and how could one
# reflect those changes in code?

# Alternate players will input symbols onto
# different places of the board.

# Visual presentation of such dynamic.
# And such dynamic as such is already
# implemented irregardless of nodes and
# node_trees.

# How are nodes and node_trees to be linked
# to such a dynamic?

# One could think of each symbol input as a node.
# However, since it seems necessary that each node
# has the information of its children nodes, each
# node would have to be a node_tree.

# As of right now NodeTree takes in the id[cell idx]
# of the respective node and the entire board.
# The last being thought as a parallel board, as a
# mirror board of the board initially made up of
# ' ' elements.

# Perhaps this could be simplified for there to be only
# one single board instance variable for each game.
# However, let's let this point rest for awhile.

# So each user input will have to not only update
# the corresponding cell to the player's symbol
# but also associate a NodeTree to that specific cell.

# Why is that?
# Because it seems that that is the only way to
# "permanently evaluate" game_over?. In a manner yet to
# be found: through a BFS of the graph that each NodeTree
# seems to have to represent.

# Is there a difference in thinking each NodeTree as merely
# a NodeTree and not a graph?
# It seems that every node (that every node tree) on a graph
# is itself a graph, is itself a point starting on which
# at least part of a graph will have to become manifest.

# However the "permanent evaluation" of game_over? seems to
# require not only that each user input translates into a
# node, but that the possibily of previous user inputs
# relating to the most recent user input is checked.
# New user inputs might mean children to previously
# defined nodes/node_trees!

# Hence each user input will have to not only translate
# an update on the display of the respective cell on the board
# and an update of respective cell on the board as such, but 
# also, and fundamentally so (it seems), an update of each
# non-nil cell of the board.

# Well perhaps not of every non-nil cell of the board.
# Is it possible, in this board case, for a node X to be 
# a child of node Y and node Y not to be a child of node X?
# It seems not. But let's take an/a few examples.

# Consider there is a node of id 36.
# A node is inserted with id 37.
# node.id(36) will be a child of node.id(37).
# Specifically, in light of the actual state of the code,
# node.id(36) will be (node.id(37)).child7, if that is correct.
# Where (node.id(37)).child7 is attained through the calculation
# of id + (-1).

# But node.id(37) ill also be a child of node.id(36) through
# the symmetrical calculation.
# That is:
# node.id(37) == (node.id(36)).child8, if that is correct,
# through the calculation of id + 1

# It seems plausible to think that if one node X is a child of
# some other node Y, node Y will also have to be a child of
# node X.

# That said: the "permanent evaluation" of game_over? seems,
# then, not to imply an update of every non-nil value on the
# board, but only of the most recent user input children nodes!

# To sum up:
# Every user input requires:
# - An update on the respective cell display.
# - An update on the respective cell as such.
# - An update on the respective cell's children cells.

# The last update could perhaps be directly implemented
# to the NodeTree build_tree method.
# If corresponding cell id is not nil, update not only
# respective root_node child to that value, but update
# that root_node child's children accordingly - that is,
# symmetrically, as shown above.

# As of right now:
# ✓ An update on the respective cell display.
# ✓ An update on the respective cell's children cells.

# Missing:
# - An update on the respective cell as such.
# And seemingly required integration into the current 
# game methods of the Node and NodeTree classes.

# As of right now Node and NodeTree classes play
# absolutely no role in the game class.

# The idea was for them to have a role. And a central
# one at that: that of enabling the "permanent evaluation"
# of the game_over? method.

# At least three different paths present themselves:
# 1. Refactor Board class for there to be only one
#    Board class present on the Game class.
# 2. Add a new parameter for a Board specifically of
#    nodes, meant to mirror every Board (the one used
#    for display purposes) method and action.
# 3. Test that the current idea for solving the
#    "permanent evaluation" of game_over?, reliant on
#    the Node and NodeTree classes actually works
#    before trying to refactor the whole damn Board and
#    Game classes.

# Path number 3 seems to be the wisest one...
# Let us tackle point 3 then.

# Assuming a board made up of nil values.
# Assuming there is only **one** symbol to search for
# on the board.

# A sort of loop will have to be made for
# each of the elements constituting the board.

# If it is not nil, a depth-first-search will have to
# be made as regards to the possibly connected cells.

# A verified list will have to be constitued so as to
# avoid duplication of values.

# Defined point 3 to work on, ended up working on 
# point 1...
# As result and as of right now, seemingly:
# ✓ An update on the respective cell display.
# ✓ An update on the respective cell as such.
# ✓ An update on the respective cell's children cells.

# But still missing:
# - "Permanent evaluation" of game_over?

############### 30 April #####################

# Point to be worked on:
# - "Permanent evaluation" of game_over? method.

# Brainstorm:
# Grid of numbered cells.
# 3 possibilities for each cell:
# nil, symbol 1 or symbol 2.

# game_over? method seems to have to rely on
# a scan of board.cells and two counters.
# One counter for the largest component of
# symbol 1.
# One counter for the largest component of 
# symbol 2.

# Note:
# Additional tests added to #update_board method.