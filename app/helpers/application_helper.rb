module ApplicationHelper
  def emoji_url(emoji)
    if url = Emoji.find_by_alias(emoji).try(:image_filename)
      "/images/emoji/#{url}"
    else
      CustomEmoji.find_by_name(emoji).try(:url)
    end
  end
end
