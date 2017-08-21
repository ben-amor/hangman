require 'constants'
require 'game_state'

class ScreenRenderer
  def render_to_screen(game_state)

    puts "#{Constants::NEW_GAME} for new game"
    puts "#{Constants::QUIT} to quit"

    case game_state.game_status
      when GameState::IN_PROGRESS

      when GameState::WON
        puts 'Victory'
      when GameState::LOST
        put 'Defeat'
    end

  end
end