class Deck
  attr_reader :type, :team

  EMOJI_LIST = {
    likes: %w(+1),
    love: %w(heart)
  }.freeze

  def initialize(type, options = {})
    @type = type
    @emojis = EMOJI_LIST[type]
    @team = options[:team]
  end

  def title
    I18n.t(type, scope: [:deck, :title], team: @team.name)
  end

  def subtitle
    I18n.t(type, scope: [:deck, :subtitle], team: @team.name, raise: true)
  rescue I18n::MissingTranslationData
    nil
  end

  def cards
    @cards ||= users.map { |user| card(user) }
  end
end
