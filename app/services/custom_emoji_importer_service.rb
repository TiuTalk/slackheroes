class CustomEmojiImporterService
  attr_reader :team

  def initialize(team)
    @team = team
  end

  def call
    emojis.each do |emoji|
      name, url = emoji
      team.custom_emojis.find_or_create_by!(name: name, url: url)
    end
  end

  private
  def emojis
    client = Slack::Web::Client.new(token: team.token)
    client.emoji_list.emoji
  end
end
