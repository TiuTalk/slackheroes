class EmojiImporterService
  def self.call
    emojis.each do |emoji|
      name, url = emoji
      Emoji.find_or_create_by!(name: name, url: url)
    end
  end

  def self.emojis
    client = Slack::Web::Client.new
    client.emoji_list.emoji
  end

  private_class_method :emojis
end
