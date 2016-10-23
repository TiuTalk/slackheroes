class Deck
  attr_reader :type, :team

  EMOJI_LIST = {
    likes: %w(+1),
    love: %w(heart heart_eyes heart_eyes_cat two_hearts heartpulse),
    kisser: %w(kissing_heart kissing kissing_smiling_eyes kissing_closed_eyes kissing_cat),
    religious: %w(pray),
    smile: %w(grinning grimacing grin smiley smile laughing slightly_smiling_face),
    money: %w(money_mouth_face moneybag money_with_wings dollar yen euro pound),
    cry: %w(cry sob crying_cat_face),
    erotic: %w(mr_bean_erotic pump_it_up_girl pump_it_up_girl_left awww_yisss),
    parrot: %w(dealwithitparrot explodyparrot fastparrot fiesta_parrot middleparrot oldtimeyparrot sadparrot shuffleparrot partyparrot slowparrot)
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
