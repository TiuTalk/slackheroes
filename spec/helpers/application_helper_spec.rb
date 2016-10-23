require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#emoji_url' do
    it 'returns emojis defaults img tag' do
      expect(helper.emoji_url('smile')).to \
        be_eql("/images/emoji/unicode/1f604.png")
    end

    it 'returns custom emojis from img tag' do
      create(:custom_emoji, name: 'lol', url: 'http://google.com/image/lol')
      expect(helper.emoji_url('lol')).to be_eql("http://google.com/image/lol")
    end

    it 'returns nil when does not exists' do
      expect(helper.emoji_url('aaa')).to be_nil
    end
  end
end
