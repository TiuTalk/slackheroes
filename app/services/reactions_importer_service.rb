class ReactionsImporterService
  def self.call(user, page)
    reactions_result = reactions_from(user, page)
    perform_next_pages(reactions_result, user, page)
    reactions_result.items.
      select { |c| c.type == 'message' && c.message.user.present? }.
      each do |content|
        message = content.message
        if author_user = User.find_by_uid(message.user)
          message.reactions.
            select { |r| r.users.include?(user.uid) }.
            each do |reaction|
              ReactionImporterJob.perform_later(
                receiver: author_user,
                sender: user,
                emoji: reaction.name,
                message_uid: message.ts
              )
          end
        end
      end
  end

  def self.perform_next_pages(result, user, page)
    if result.paging.pages > page
      ReactionsImporterJob.perform_later(user, page+1)
    end
  end

  def self.reactions_from(user, page)
    client = Slack::Web::Client.new
    client.reactions_list(count: 500, user: user.uid, page: page)
  end
end
