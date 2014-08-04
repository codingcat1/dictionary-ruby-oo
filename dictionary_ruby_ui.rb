require './lib/term'
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
      new_word
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

def new_word
  puts "*** New Word ***"
  puts "Please enter in the new word you'd like to add"
  word_user_input = gets.chomp
  puts "Please enter the definition of the word"
  definition_user_input = gets.chomp
  Term.new(word_user_input, definition_user_input).save
  Term.all.each do |term|
    @current_term = term
  end
  puts "Word created!"
end

def list_words
  puts "*** Word List ***"
  Term.all.each_with_index do |term, index|
  puts "#{index+1}. " + term.word + ": " + term.definition
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

  puts "Word: " + @current_term.word
  puts "Definition: " + @current_term.definition
  puts "Press 'w' to edit the word or 'd' to edit the definition"
  puts "Press 'x' to return to the previous menu"
  main_choice = gets.chomp
  if main_choice == 'w'
    puts "Please enter the new word"
    edited_word = gets.chomp
    @current_term.edit_word(edited_word)
    puts @current_term.word
  elsif main_choice == 'd'
    puts "Please enter in the new definition"
    edited_definition = gets.chomp
    @current_term.edit_definition(edited_definition)
    puts @current_term.definition
  elsif main_choice == 'x'
    list_words
  end
  list_words
end

def remove_word
  puts "*** Remove Word ***"
  Term.all.each_with_index do |term, index|
  puts "#{index+1}. " + term.word + ": " + term.definition
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


