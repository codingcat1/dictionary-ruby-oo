require './lib/term'
require 'pry'

@current_word = nil

def main_menu
  loop do
    puts "Press 'n' to create a new word in the dictionary"
    puts "Press 'l' to list all the words"
    puts "Press 'x' to exit"
    main_choice = gets.chomp
    if main_choice == 'n'
      new_word
    elsif main_choice == 'l'
      list_words
    elsif main_choice == 'x'
      puts "Goodbye!"
      exit
    end
  end
end

def new_word
  puts "Please enter in the new word you'd like to add"
  word_user_input = gets.chomp
  puts "Please enter the definition of the word"
  definition_user_input = gets.chomp
  Term.new(word_user_input, definition_user_input).save
  Term.all.each do |term|
    @current_word = term
  end
  puts "Word created!"
end

def list_words
  Term.all.each_with_index do |term, index|
  puts "#{index+1}. " + term.word + ": " + term.definition
  @word_number = "#{index}"
  end

  puts "Press the number of the word you'd like to view"
  list_words_response = gets.chomp
  Term.all.each do |term|
    if list_words_response == @word_number
      @current_word = word
    end
  end

  puts "Word: " + @current_word.word
  puts "Definition: " + @current_word.definition
  puts "Press 'w' to edit the word and 'd' to edit the definition"
  main_choice = gets.chomp
  if main_choice == 'w'
    puts "Please enter the new word"
    edited_word = gets.chomp
    @current_word.edit_word(edited_word)
    puts @current_word.word
  elsif main_choice == 'd'
    puts "Please enter in the new definition"
    edited_definition = gets.chomp
    @current_word.edit_definition(edited_definition)
    puts @current_word.definition
  end

end

main_menu


