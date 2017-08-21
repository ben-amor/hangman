require 'random-word'

class WordFactory
  def get_word
    RandomWord.nouns.next
  end
end