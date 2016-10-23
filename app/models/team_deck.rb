class TeamDeck < Deck
  def initialize(options = {})
    super(:team, options)
  end

  def users
    @team.users.order(name: :asc)
  end

  def card(user)
    top_emoji = top_emoji(user)
    bottom_emoji = bottom_emoji(user)

    Card.new(user, [top_emoji, bottom_emoji])
  end

  private

  def top_emoji(user)
    emoji, count = user.reactions_sent.top.first
    { emoji: emoji, count: count }
  end

  def bottom_emoji(user)
    emoji, count = user.reactions_received.top.first
    { emoji: emoji, count: count }
  end
end
