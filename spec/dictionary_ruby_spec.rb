require 'rspec'
require 'term'

describe Term do
  it 'initializes a new term' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    test_term.should be_an_instance_of Term
  end

  it 'shows the user the term they initialized' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    test_term.word.should eq 'carrot'
  end

  it 'shows the user the definition of the term they initialized' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    test_term.definition.should eq 'A delicious vegetable.'
  end
end
