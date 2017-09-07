require 'flow_of_control_constants'
require 'game_state'

class ScreenRenderer
  def render_to_screen(game_state, most_recent_guess, most_recent_response_type)

    puts "#{Game::NEW_GAME} for new game"
    puts "#{Game::QUIT} to quit"

    case game_state.game_status
      when :in_progress
        message = RESPONSE_MESSAGES[most_recent_response_type]
        puts message % most_recent_guess if message

        puts "Guesses so far: #{game_state.characters_guessed.join(',')}"
        puts "Lives remaining: #{game_state.lives_remaining}"
        puts "State of play: #{get_guesses_in_ordinal_positions_for_display(game_state)} (#{game_state.current_word.size})"
        puts 'Your guess:'
      when :won
        puts 'Victory'
      when :lost
        puts 'Defeat'
    end

  end

  def get_guesses_in_ordinal_positions_for_display(game_state)
    game_state.current_word.chars.map { |char| (game_state.characters_guessed.include?(char) ? char : '_') }.join
  end

  private

  RESPONSE_MESSAGES = {
      :invalid_input => "%s is not a valid guess. You can only guess single alphabetic characters",
      :already_guessed => "You've already guessed %s",
      :hit => "%s appears in the word",
      :miss => "%s doesn't appear in the word"
  }

end
