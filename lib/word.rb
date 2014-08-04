class Word

  def initialize(word, language)
    @word = word
    @language = language
  end

  def word
    @word
  end

  def edit_word(new_word)
    @word = new_word
  end

  def language
    @language
  end

end
