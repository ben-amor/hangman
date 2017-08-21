require 'flow_of_control_constants'
require 'game_state'
require 'guess_response'

class ScreenRenderer
  def render_to_screen(game_state, most_recent_guess)

    puts "#{FlowOfControlConstants::NEW_GAME} for new game"
    puts "#{FlowOfControlConstants::QUIT} to quit"

    case game_state.game_status
      when GameState::IN_PROGRESS
        message = @@response_messages[game_state.most_recent_response_type]
        puts message % most_recent_guess if message

        puts "Guesses so far: #{game_state.characters_guessed.join(',')}"
        puts "Lives remaining: #{game_state.lives_remaining}"
        puts "State of play: #{get_guesses_in_ordinal_positions_for_display(game_state)} (#{game_state.current_word.size})"
        puts 'Your guess:'
      when GameState::WON
        puts 'Victory'
      when GameState::LOST
        put 'Defeat'
    end

  end

  def get_guesses_in_ordinal_positions_for_display(game_state)
    string_for_display = ''
    game_state.current_word.chars.each{|char|
      string_for_display += (game_state.characters_guessed.include?(char) ? char : '_')
    }
    return string_for_display
  end

  @@response_messages = {
      GuessResponse::INVALID_INPUT => "%s is not a valid guess. You can only guess single alphabetic characters",
      GuessResponse::ALREADY_GUESSED => "You've already guessed %s",
      GuessResponse::HIT => "%s appears in the word",
      GuessResponse::MISS => "%s doesn't appear in the word"
  }

end