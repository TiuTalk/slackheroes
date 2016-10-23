require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#emoji_url' do
    let(:team) { create(:team, name: 'TEAM') }
    it 'returns emojis defaults img tag' do
      expect(helper.emoji_url('smile', team)).to \
        be_eql("/images/emoji/unicode/1f604.png")
    end

    it 'returns custom emojis from img tag' do
      create(:custom_emoji, name: 'lol', url: 'http://google.com/image/lol', team: team)
      expect(helper.emoji_url('lol', team)).to be_eql("http://google.com/image/lol")
    end

    it 'returns custom emojis from img tag for the right team' do
      create(:custom_emoji, name: 'lol', url: 'http://google.com/image/lol', team: team)
      create(:custom_emoji, name: 'lol', url: 'http://google.com/image/lol2')
      expect(helper.emoji_url('lol', team)).to be_eql("http://google.com/image/lol")
    end

    it 'returns the emoji name when does not exists' do
      expect(helper.emoji_url('aaa', team)).to be_eql('aaa')
    end
  end
end
