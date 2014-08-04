require './lib/term'

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
  Term.new(word_user_input).save
  Term.all.each do |term|
    @current_word = term
  end

  puts "Please enter the definition of the word"
  definition_user_input = gets.chomp
    @current_word.add_definition(definition_user_input)
  puts "Word created!"
end

def list_words
  Term.all.each_with_index do |term, index|
  puts "#{index+1}. " + term.word
  end
end

main_menu
