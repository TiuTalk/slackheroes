module ApplicationHelper
  def emoji_url(emoji, team = nil)
    image_filename = Emoji.find_by_alias(emoji).try(:image_filename)
    url = "/images/emoji/#{image_filename}" if image_filename.present?
    url ||= CustomEmoji.find_by(name: emoji, team: team).try(:url)
    url ||= CustomEmoji.find_by(name: emoji).try(:url)
    url || emoji
  end
end
