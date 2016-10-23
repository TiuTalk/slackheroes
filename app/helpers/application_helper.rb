module ApplicationHelper
  def emoji_url(emoji, team = nil)
    url = if image_filename = Emoji.find_by_alias(emoji).try(:image_filename)
            "/images/emoji/#{image_filename}"
          end
     url ||= CustomEmoji.find_by(name: emoji, team: team).try(:url)
     url || emoji
  end
end
