class Deck
  attr_reader :type, :cards

  def initialize(type)
    @type = type
    @cards = []
  end

  def title
    I18n.t(type, scope: :deck)
  end

  def cards
    return [] unless users.any?

    rand(2..4).times do
      user = users.sample
      top_emoji = { emoji: %w(+1 -1 octocat cat).sample, count: rand(1..10) }
      bottom_emoji = { emoji: %w(+1 -1 octocat cat).sample, count: rand(1..10) }

      @cards << Card.new(user, [top_emoji, bottom_emoji])
    end

    @cards
  end

  def users
    @users ||= User.all
  end
end
