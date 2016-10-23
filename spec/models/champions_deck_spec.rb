require 'rails_helper'

RSpec.describe ChampionsDeck, type: :model do
  let(:team) { create(:team) }
  let!(:users) { create_list(:user, 3, team: team) }

  before do
    20.times do
      emoji = %w(+1 heart beer joy).sample
      create(:user_reaction, team: team, sender: users.sample, receiver: users.sample, emoji: emoji)
    end
  end

  subject(:deck) { described_class.new(team: team) }

  describe '#title' do
    it 'return the deck title based on the kind' do
      expect(deck.title).to eq("The Champions of <b>#{team.name}</b>")
    end
  end

  describe '#cards' do
    it 'returns exactly 4 cards' do
      cards = deck.cards

      expect(cards.count).to eq(4)
      expect(cards.first).to be_a(Card)
      expect(cards.first.user).to be_a(User)
    end
  end
end
