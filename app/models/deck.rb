class Deck
  attr_reader :type, :team

  EMOJI_LIST = {
    likes: %w(+1),
    love: %w(heart),
    kisser: %w(kissing_heart kissing kissing_smiling_eyes kissing_closed_eyes kissing_cat),
    religious: %w(pray)
  }.freeze

  def initialize(type, options = {})
    @type = type
    @emojis = EMOJI_LIST[type]
    @team = options[:team]
  end

  def title
    I18n.t(type, scope: [:deck, :title], team: @team.name).html_safe
  end

  def subtitle
    I18n.t(type, scope: [:deck, :subtitle], team: @team.name, raise: true).html_safe
  rescue I18n::MissingTranslationData
    nil
  end

  def cards
    @cards ||= users.map { |user| card(user) }
  end
end
