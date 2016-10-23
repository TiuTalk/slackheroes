class ReactionImporterJob < ApplicationJob
  queue_as :default

  def perform(reaction)
    ReactionImporterService.call(
      receiver: reaction[:receiver],
      sender: reaction[:sender],
      emoji: reaction[:emoji],
      message_uid: reaction[:message_uid]
    )
  end
end
