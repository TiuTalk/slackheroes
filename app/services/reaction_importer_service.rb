class ReactionImporterService
  def self.call(receiver:, sender:, emoji:, message_uid:)
    UserReaction.find_or_create_by!(
      receiver: receiver,
      sender: sender,
      team: receiver.team,
      emoji: extract_emoji(emoji),
      message_uid: message_uid(message_uid)
    )
  end

  def self.extract_emoji(full_emoji)
    full_emoji.split("::").first
  end

  def self.message_uid(message)
    message.gsub('.', '')
  end
end
