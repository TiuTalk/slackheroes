class CustomEmojiImporterJob < ApplicationJob
  queue_as :default

  def perform(team)
    CustomEmojiImporterService.new(team).call
  end
end
