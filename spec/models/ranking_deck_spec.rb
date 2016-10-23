require 'rails_helper'

RSpec.describe RankingDeck, type: :model do
  subject(:deck) { described_class.new(:likes) }

  let!(:users) { create_list(:user, 3) }

  before do
    10.times { create(:user_reaction, sender: users.sample, receiver: users.sample, emoji: '+1') }
  end

  describe '#title' do
    it 'return the deck title based on the kind' do
      expect(deck.title).to eq('Users with more likes')
    end
  end

  describe '#cards' do
    it 'returns a list of Card objects' do
      cards = deck.cards

      expect(cards.count).to_not be_zero
      expect(cards.first).to be_a(Card)
      expect(cards.first.user).to be_a(User)
    end
  end
end
