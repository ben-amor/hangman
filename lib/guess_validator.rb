class GuessValidator

  def is_valid_input(character_input)
    if character_input.length != 1
      return false
    end

    return /[A-Za-z]/.match(character_input)
  end
end