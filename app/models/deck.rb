class Deck
  attr_reader :type, :cards

  EMOJI_LIST = {
    likes: %w(+1),
    love: %w(heart +1)
  }

  def initialize(type)
    @type = type
    @cards = []
  end

  def title
    I18n.t(type, scope: :deck)
  end

  def cards
    deck = RankingDeck.new(EMOJI_LIST[type])
    deck.users.map { |user| deck.card(user) }
  end

  class RankingDeck
    attr_reader :emoji_list

    def initialize(emoji_list)
      @emoji_list = emoji_list
    end

    def users(limit = 8)
      @sent_counts = UserReaction.where(emoji: emoji_list).group(:user_sender_id).order('count_all DESC').limit(limit).count
      @received_counts = UserReaction.where(emoji: emoji_list).group(:user_receiver_id).where(user_receiver_id: @sent_counts.keys).count

      User.where(id: @sent_counts.keys).to_a.sort_by do |user|
        -@sent_counts[user.id]
      end
    end

    def card(user)
      top_emoji = top_emoji(user)
      bottom_emoji = bottom_emoji(user)

      Card.new(user, [top_emoji, bottom_emoji])
    end

    private

    def top_emoji(user)
      count = @sent_counts[user.id].to_i
      { emoji: emoji_list.sample, count: count }
    end

    def bottom_emoji(user)
      count = @received_counts[user.id].to_i
      { emoji: emoji_list.sample, count: count }
    end
  end
end
