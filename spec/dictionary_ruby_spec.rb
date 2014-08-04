require 'rspec'
require 'term'

describe Term do
  it 'initializes a new term' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    expect(test_term).to be_an_instance_of Term
  end

  it 'shows the user the term they initialized' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    expect(test_term.word).to eq ['carrot']
  end

  it 'shows the user the definition of the term they initialized' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    expect(test_term.definition).to eq ['A delicious vegetable.']
  end

  it 'allows the user to add another definition' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    test_term.add_definition('Makes a delicious cake.')
    expect(test_term.definition).to eq ['A delicious vegetable.', 'Makes a delicious cake.']
  end

  it 'allows the user to add multiple words for the same definition' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    test_term.add_word('zanahoria')
    expect(test_term.word).to eq ['carrot', 'zanahoria']
  end

end
