class CustomEmojiImporterJob < ApplicationJob
  queue_as :default

  def perform(*args)
    CustomEmojiImporterService.call
  end
end
