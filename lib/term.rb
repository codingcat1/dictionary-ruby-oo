class Term
  @@all_terms = []

  def initialize(word)
    @word = word
    @definition = []
  end

  def word
    @word
  end

  def add_definition(definition)
    @definition << definition
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


end
