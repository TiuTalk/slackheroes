require 'rails_helper'

RSpec.describe Card, type: :model do
  subject(:card) { described_class.new(user, emojis) }

  let(:user) { build(:user) }
  let(:top_emoji) { { emoji: '+1', count: 10 } }
  let(:bottom_emoji) { { emoji: '-1', count: 5 } }
  let(:emojis) { [top_emoji, bottom_emoji] }

  describe '#user' do
    it 'return the provided user' do
      expect(card.user).to eq(user)
    end
  end

  describe '#top_emoji' do
    it 'return the first emoji and the count' do
      expect(card.top_emoji).to eq(top_emoji)
    end
  end

  describe '#bottom_emoji' do
    it 'return the last emoji and the count' do
      expect(card.bottom_emoji).to eq(bottom_emoji)
    end
  end
end
