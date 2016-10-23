module ApplicationHelper
  def emoji_url(emoji, team)
    if url = Emoji.find_by_alias(emoji).try(:image_filename)
      "/images/emoji/#{url}"
    else
      CustomEmoji.find_by(name: emoji, team: team).try(:url)
    end
  end
end
