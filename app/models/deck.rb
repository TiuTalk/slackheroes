class Deck
  attr_reader :type

  EMOJI_LIST = {
    likes: %w(+1),
    love: %w(heart)
  }.freeze

  def initialize(type)
    @type = type
    @emojis = EMOJI_LIST[type]
  end

  def title
    I18n.t(type, scope: :deck)
  end

  def cards
    users.map { |user| card(user) }
  end
end
