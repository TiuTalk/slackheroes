class Card
  attr_reader :user, :top_emoji, :bottom_emoji

  def initialize(user, emojis)
    @user = user
    @top_emoji, @bottom_emoji = emojis
  end
end
