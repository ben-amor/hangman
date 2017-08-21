require 'constants'
require 'game_state'

class ScreenRenderer
  def render_to_screen(game_state)

    puts "#{Constants::NEW_GAME} for new game"
    puts "#{Constants::QUIT} to quit"

    case game_state.game_status
      when GameState::IN_PROGRESS
        puts game_state.most_recent_message
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
end