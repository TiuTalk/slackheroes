class EmojiImporterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    EmojiImporterService.call
  end
end
