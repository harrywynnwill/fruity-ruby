require 'rules'
describe Rules do
  subject(:rules) { Rules.new }
  let(:all_the_colours) {[:blue, :blue, :blue, :blue]}
  let(:all_different_colours) {[:blue, :green, :red, :yellow]}
  let(:two_adjacent_colours) {[:red, :blue, :blue, :yellow]}

  describe '#all_the_same_colour' do
    it 'returns true if all the colours are the same' do
      expect(subject.all_the_same_colour? all_the_colours).to be_truthy
      expect(subject.all_the_same_colour? all_different_colours).to be_falsey
    end
  end

  describe '#all_different_colours' do
    it 'returns true if all 4 colours are different' do
      expect(subject.all_different_colours? all_different_colours).to be_truthy
      expect(subject.all_different_colours? all_the_colours).to be_falsey
    end
  end

  describe '#two_or_more_adjacent' do
    it 'returns true if two or more colours are adjacent' do
      expect(subject.two_or_more_adjacent_colours? two_adjacent_colours).to be_truthy
      expect(subject.two_or_more_adjacent_colours? all_different_colours).to be_falsey
    end
  end
end
