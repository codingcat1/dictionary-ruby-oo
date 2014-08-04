require './lib/term'
require './lib/word'
require './lib/definition'
require 'pry'

@current_term = nil

def main_menu
  loop do
    puts "*** Main Menu ***"
    puts "Press 'n' to create a new word in the dictionary"
    puts "Press 'l' to list all the words"
    puts "Press 's' to search for a word"
    puts "Press 'x' to exit"
    main_choice = gets.chomp
    if main_choice == 'n'
      new_word_ui
    elsif main_choice == 'l'
      list_words
    elsif main_choice == 's'
      search_word
    elsif main_choice == 'x'
      puts "Goodbye!"
      exit
    end
  end
end

def new_word_ui
  puts "*** New Word ***"
  puts "Please enter in the new word you'd like to add"
  word_user_input = gets.chomp
  puts "Please enter the language of the word"
  language_user_input = gets.chomp
  new_word = Word.new(word_user_input, language_user_input)
  puts "Please enter the definition of the word"
  definition_user_input = gets.chomp
  puts "Please enter the language of the definition"
  language_user_input = gets.chomp
  new_definition = Definition.new(definition_user_input, language_user_input)
  Term.new(new_word, new_definition).save
  Term.all.each do |term|
    @current_term = term
  end
  puts "Word created!"
end

def list_words
  puts "*** Word List ***"
  Term.all.each_with_index do |term, index|
  puts "#{index+1}. " + term.word.word + " - " + term.word.language + ": " + term.definition.definition + " - " + term.definition.language
  @word_number = "#{index+1}"
  end

  puts "Press the number of the word you'd like to view"
  puts "Press 'r' to remove a word & definition"
  puts "Press 'x' to return to the main menu"
  list_words_response = gets.chomp
  Term.all.each do |term|
    if list_words_response == @word_number
      @current_term = term
    elsif list_words_response == "r"
      remove_word
    elsif list_words_response == "x"
      main_menu
    end
  end

  puts "Word: " + @current_term.word.word
  puts "Definition: " + @current_term.definition.definition
  puts "Press 'w' to edit the word or 'd' to edit the definition"
  puts "Press '+w' to add another word to an existing term"
  puts "Press '+d' to add another definition"
  puts "Press 'x' to return to the previous menu"
  main_choice = gets.chomp
  if main_choice == 'w'
    puts "Please enter the new word"
    edited_word = gets.chomp
    @current_term.word.edit_word(edited_word)
    puts @current_term.word
  elsif main_choice == 'd'
    puts "Please enter in the new definition"
    edited_definition = gets.chomp
    @current_term.definition.edit_definition(edited_definition)
    puts @current_term.definition.to_s
  elsif main_choice == '+w'
    add_word_ui
  elsif main_choice == '+d'
    add_definition_ui
  elsif main_choice == 'x'
    list_words
  end
  list_words
end

def add_word_ui
  puts "Type in the additional word"
  user_add_word = gets.chomp
  puts "Enter the language"
  user_language = gets.chomp
  new_word = Word.new(user_add_word, user_language)
  @current_term.add_word(new_word)
  puts "Word added!"
  puts @current_term.word.to_s
end


def add_definition_ui
  puts "Type in the additional definition"
  user_add_definition = gets.chomp
  puts "Type in the language of the definition"
  user_definition_language = gets.chomp
  new_definition = Definition.new(user_add_definition, user_definition_language)
  binding.pry
  @current_term.add_definition(new_definition)
  puts "Definition added!"
  puts @current_term.definition.definition
end

def remove_word
  puts "*** Remove Word ***"
  Term.all.each_with_index do |term, index|
  puts "#{index+1}. " + term.word.to_s + ": " + term.definition.to_s
  @word_number = "#{index+1}"
  end
  puts "Press the number of word that you would like to remove"
  list_words_response = gets.chomp
  Term.all.each do |term|
    if list_words_response == @word_number
      @current_term = term
      Term.all.delete_at(@word_number.to_i-1)
      puts "WORD DELETED!!"
    end
  end
end

def search_word
  puts "*** Search Word ***"
  puts "Enter the word whose definition you would like returned."
  puts "Press 'x' to return to the main menu"
  search_word_input = gets.chomp
  if search_word_input == 'x'
    main_menu
  else
    Term.search(search_word_input)
  end
    search_word
end

main_menu


