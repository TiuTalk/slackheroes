class ChampionsDeck < Deck
  CARDS = {
    super_crush: { received: %w(heart hearts heart_eyes heartpulse heart_decoration heart_eyes_cat) },
    the_oh_mighty: { sent: :all },
    joker: { received: %w(joy joy_cat laughing smile smiley smile_cat slightly_smiling_face upside_down_face stuck_out_tongue_closed_eyes) },
    drunk: { received: %w(beer beers wine_glass sake cocktail champagne) }
  }.freeze

  def initialize(options = {})
    super(:champions, options)
  end

  def cards
    CARDS.to_a.sample(4).map do |type, rules|
      user_id, count = find_champion(*rules.first)

      if user_id.present?
        user = team_users.find(user_id)
        Card.new(user, count: count, klass: type)
      end
    end.compact.shuffle
  end

  private

  def find_champion(rule, emoji)
    column = (rule == :received) ? :user_receiver_id : :user_sender_id

    if emoji == :all
      champion = team_reactions.top(column)
    else
      champion = team_reactions.where(emoji: emoji).top(column)
    end

    champion.first.to_a
  end
end
