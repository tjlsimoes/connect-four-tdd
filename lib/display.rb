
# Text needed for connect_four

module Display

	def intro_msg
		"Let's play a simple connect-four game in the console! \n\n"
	end

	def display_player_turn(name, symbol)
    "#{name}, please enter a number (1-7) that is available to place an '#{symbol}'"
  end

	def display_input_warning
    "\e[31mSorry, that is an invalid input. Please, try again.\e[0m"
  end
end