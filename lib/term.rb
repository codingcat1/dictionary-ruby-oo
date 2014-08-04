class Term
  @@all_terms = []

  def initialize(word, definition)
    @word = word
    @definition = [definition]
  end

  def word
    @word
  end

  # def edit_word(new_word)
  #   @word = new_word
  # end

  def add_definition(definition)
    @definition << definition
  end

  def add_word(word)
    @word << word
  end

  def definition
    @definition
  end

  def save
    @@all_terms << self
  end

  def Term.all
    @@all_terms
  end

  def Term.search(word_search)
    @@all_terms.each do |term|
      if word_search = term.word
        puts term.word.to_s + ": " + term.definition.to_s + "\n\n"
      end
    end
  end


end
