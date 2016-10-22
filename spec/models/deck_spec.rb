require 'rails_helper'

RSpec.describe Deck, type: :model do
  subject(:deck) { described_class.new(:likes) }

  describe '#title' do
    it 'return the deck title based on the kind' do
      expect(deck.title).to eq('Usuários que mais curtiram')
    end
  end

  describe '#cards' do
    it 'returns a list of Card objects' do
      cards = deck.cards

      expect(cards.count).to_not be_zero
      expect(cards.first).to be_a(Card)
    end
  end
end
