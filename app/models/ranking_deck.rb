class RankingDeck < Deck
  def users(limit = 8)
    @sent_counts = UserReaction.where(emoji: @emojis).group(:user_sender_id).order('count_all DESC').limit(limit).count
    @received_counts = UserReaction.where(emoji: @emojis).group(:user_receiver_id).where(user_receiver_id: @sent_counts.keys).count

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
    emoji_count(@sent_counts[user.id].to_i)
  end

  def bottom_emoji(user)
    emoji_count(@received_counts[user.id].to_i)
  end

  def emoji_count(count)
    { emoji: @emojis.sample, count: count }
  end
end
