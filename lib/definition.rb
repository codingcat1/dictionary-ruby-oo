class Definition
  @@all_definitions = []

  def initialize(definition, language)
    @definition = definition
    @language = language
  end

  def definition
    @definition
  end

  def language
    @language
  end


  def edit_definition(new_definition)
    @definition = new_definition
  end

end
