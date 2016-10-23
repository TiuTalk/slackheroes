require 'rails_helper'

RSpec.describe TeamDeck, type: :model do
  let(:team) { create(:team) }
  let!(:users) { create_list(:user, 3, team: team) }

  before do
    10.times { create(:user_reaction, team: team, sender: users.sample, receiver: users.sample, emoji: '+1') }
  end

  subject(:deck) { described_class.new(team: team) }

  describe '#title' do
    it 'return the deck title based on the kind' do
      expect(deck.title).to eq("All the heroes of #{team.name}")
    end
  end

  describe '#cards' do
    it 'returns a list of Card for each team member' do
      cards = deck.cards

      expect(cards.count).to eq(3)
      expect(cards.first).to be_a(Card)
      expect(cards.first.user).to be_a(User)
    end
  end
end

