require 'rspec'
require 'term'

describe Term do
  it 'initializes a new term' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    expect(test_term).to be_an_instance_of Term
  end

  it 'shows the user the term they initialized' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    expect(test_term.word).to eq 'carrot'
  end

  it 'shows the user the definition of the term they initialized' do
    test_term = Term.new('carrot', 'A delicious vegetable.')
    expect(test_term.definition).to eq 'A delicious vegetable.'
  end

end
